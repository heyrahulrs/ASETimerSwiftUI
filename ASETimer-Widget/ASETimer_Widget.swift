//
//  ASETimer_Widget.swift
//  ASETimer-Widget
//
//  Created by Rahul Sharma on 10/7/20.
//  Copyright © 2020 Rahul Sharma. All rights reserved.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {

    func placeholder(
        in context: Context
    ) -> SimpleEntry {
        SimpleEntry()
    }

    func getSnapshot(
        in context: Context,
        completion: @escaping (SimpleEntry) -> ()
    ) {
        let entry = SimpleEntry()
        completion(entry)
    }

    func getTimeline(
        in context: Context,
        completion: @escaping (Timeline<Entry>) -> ()
    ) {
        let entry = SimpleEntry()
        if entry.eventConcluded {
            let timeline = Timeline(entries: [entry], policy: .never)
            completion(timeline)
        } else {
            let timeline = Timeline(entries: [entry],
                                    policy: .after(entry.eventDate))
            completion(timeline)
        }
    }

}

struct SimpleEntry: TimelineEntry {
    var date = Date()
    var eventDate: Date = Date(timeIntervalSince1970: Event().unixTime)
    var eventConcluded: Bool { eventDate < date }
}

struct ASETimer_WidgetEntryView : View {

    var entry: Provider.Entry

    @Environment(\.widgetFamily) var widgetFamily

    var imageName: String {
        "hero_widget"
    }

    var text: some View {
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
                .foregroundColor(Color("HeroColor"))
                Spacer()
            }
        }
        .padding()
    }

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geometry.size.width,
                           height: geometry.size.height)
                    .clipped()
                    .unredacted()
            }
            text
        }
    }

}

@main
struct ASETimer_Widget: Widget {
    let kind: String = "ASETimer_Widget"

    var body: some WidgetConfiguration {
        StaticConfiguration(
            kind: kind, provider: Provider()
        ) { entry in
            ASETimer_WidgetEntryView(entry: entry)
        }
        .configurationDisplayName("ASE Timer")
        .description("Countdown for WWDC 2022 Keynote")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

struct ASETimer_Widget_Previews: PreviewProvider {
    static var previews: some View {
        let entry = SimpleEntry()
        let systemSmall = WidgetPreviewContext(family: .systemSmall)
        let systemMedium = WidgetPreviewContext(family: .systemMedium)
        return Group {
            ASETimer_WidgetEntryView(entry: entry)
                .previewContext(systemSmall)
            ASETimer_WidgetEntryView(entry: entry)
                .previewContext(systemMedium)
            ASETimer_WidgetEntryView(entry: entry)
                .redacted(reason: .placeholder)
                .previewContext(systemSmall)
            ASETimer_WidgetEntryView(entry: entry)
                .redacted(reason: .placeholder)
                .previewContext(systemMedium)
        }
    }
}
