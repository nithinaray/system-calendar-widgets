//
//  SystemCalendarWidget.swift
//  SystemCalendarWidget
//
//  Created by Nithi on 7/14/20.
//

import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    public typealias Entry = SimpleEntry

    public func snapshot(with context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date())
        completion(entry)
    }

    public func timeline(with context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        var entries: [SimpleEntry] = []

        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    public let date: Date
}

struct PlaceholderView : View {
    var body: some View {
        SmallCalendar()
    }
}

struct SystemCalendarWidgetEntryView : View {
    var entry: Provider.Entry
    @Environment(\.widgetFamily) var family: WidgetFamily

    @ViewBuilder
    var body: some View {
        switch family {
            case .systemSmall: SmallCalendar()
            case .systemMedium: MediumCalendar()
            case .systemLarge: LargeCalendar()
            default: SmallCalendar()
        }
    }
}

@main
struct SystemCalendarWidget: Widget {
    private let kind: String = "SystemCalendarWidget"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider(), placeholder: PlaceholderView()) { entry in
            SystemCalendarWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("System Calendar")
        .description("This is a re-creation of the iOS system Calendar")
    }
}

struct SystemCalendarWidget_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SmallCalendar()
                .previewContext(WidgetPreviewContext(family: .systemSmall))

            MediumCalendar()
                .previewContext(WidgetPreviewContext(family: .systemMedium))

            LargeCalendar()
                .previewContext(WidgetPreviewContext(family: .systemLarge))

            PlaceholderView().previewContext(WidgetPreviewContext(family: .systemSmall))
        }
    }
}
