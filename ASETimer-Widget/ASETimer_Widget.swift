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
    var eventDate: Date = Date(timeIntervalSince1970: 1602608400)
}

struct ASETimer_WidgetEntryView : View {
    var entry: Provider.Entry

    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            SystemSmallWidget(entry: entry)
        case .systemMedium:
            SystemMediumWidget(entry: entry)
        default:
            SystemSmallWidget(entry: entry)
        }
    }
}

struct SystemSmallWidget : View {
    var entry: Provider.Entry

    @Environment(\.redactionReasons) var redactionReasons

    var foregroundColor: Color {
        Color(red: 0.98, green: 0.85, blue: 0.45)
    }

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                HStack {
                    if redactionReasons.isEmpty {
                        Text(entry.eventDate, style: .relative)
                            .fontWeight(.bold)
                            .foregroundColor(foregroundColor)
                    } else {
                        Text(entry.eventDate, style: .relative)
                            .fontWeight(.bold)
                            .foregroundColor(foregroundColor)
                            .background(
                                foregroundColor
                                    .opacity(0.7)
                                    .cornerRadius(4.0)
                            )
                    }
                    Spacer()
                }
            }
            .padding()
            .background(
                Image("hero__d6adldydsqye_large")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(x: geometry.size.width / 2 - 32)
                    .unredacted()
            )
        }
    }
}

struct SystemMediumWidget : View {

    @Environment(\.redactionReasons) var redactionReasons

    var entry: Provider.Entry

    var foregroundColor: Color {
        Color(red: 0.98, green: 0.85, blue: 0.45)
    }

    var body: some View {
        VStack(spacing: 0.0) {
            Spacer()
            HStack {
                if redactionReasons.isEmpty {
                    Text(entry.eventDate, style: .relative)
                        .fontWeight(.bold)
                        .foregroundColor(foregroundColor)
                } else {
                    Text(entry.eventDate, style: .relative)
                        .fontWeight(.bold)
                        .foregroundColor(foregroundColor)
                        .background(
                            foregroundColor
                                .opacity(0.7)
                                .cornerRadius(4.0)
                        )
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(
            Image("hero__d6adldydsqye_large")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .unredacted()
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
        .description("Countdown for Apple Event October 2020")
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
