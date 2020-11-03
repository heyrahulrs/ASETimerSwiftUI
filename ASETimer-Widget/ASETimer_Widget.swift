//
//  ASETimer_Widget.swift
//  ASETimer-Widget
//
//  Created by Rahul Sharma on 10/7/20.
//  Copyright © 2020 Rahul Sharma. All rights reserved.
//

#if canImport(WidgetKit)
import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry()
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry()
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        let entry = SimpleEntry()
        let timeline = Timeline(entries: [entry], policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    var date = Date()
    var eventDate: Date = Date(timeIntervalSince1970: Event().unixTime)
    var eventConcluded: Bool { eventDate < date }
}

struct ASETimer_WidgetEntryView : View {
    var entry: Provider.Entry

    @Environment(\.redactionReasons) var redactionReasons
    @Environment(\.widgetFamily) var widgetFamily

    var imageName: String {
        widgetFamily == .systemSmall ? "widget-small" : "widget-medium"
    }

    var body: some View {
        Group {
            Image(uiImage: UIImage(named: imageName)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .unredacted()
                .background(Color.black)
        }
        .overlay(
            VStack {
                Spacer()
                HStack {
                    Group {
                        if entry.eventConcluded {
                            Text("Event Ended")
                        } else {
                            Text(entry.eventDate, style: .relative)
                                .fontWeight(.bold)
                        }
                    }
                    .font(widgetFamily == .systemSmall ? .body : .title)
                    .foregroundColor(.white)
                    .background(
                        Color.white
                            .opacity(redactionReasons.isEmpty ? 0.0 : 0.7)
                            .clipShape(ContainerRelativeShape())
                    )
                    Spacer()
                }
            }
            .padding()
        )
    }
}

@main
struct ASETimer_Widget: Widget {
    let kind: String = "ASETimer_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            ASETimer_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("ASE Timer")
        .description("Countdown for Apple Event November 2020")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct ASETimer_Widget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ASETimer_WidgetEntryView(entry: SimpleEntry())
                .previewContext(WidgetPreviewContext(family: .systemSmall))
            ASETimer_WidgetEntryView(entry: SimpleEntry())
                .previewContext(WidgetPreviewContext(family: .systemMedium))
            ASETimer_WidgetEntryView(entry: SimpleEntry())
                .previewContext(WidgetPreviewContext(family: .systemSmall))
                .redacted(reason: .placeholder)
            ASETimer_WidgetEntryView(entry: SimpleEntry())
                .previewContext(WidgetPreviewContext(family: .systemMedium))
                .redacted(reason: .placeholder)
        }
    }
}
#endif
