//
//  WordClockWidget.swift
//  WordClockWidget
//
//  Created by Jean Raphael Bordet  on 29/04/22.
//

import WidgetKit
import SwiftUI
import TimeInWordsFeature
import ComposableArchitecture
import TimeInWords

var calendar = Calendar.current

struct Provider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        let timeInWords = timeInWords(
            h: calendar.component(.hour, from: Date()),
            m: calendar.component(.minute, from: Date())
        )
        
        return SimpleEntry(date: Date(), timeInWords: timeInWords)
    }
    
    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let timeInWords = TimeInWords.timeInWords(
            h: calendar.component(.hour, from: Date()),
            m: calendar.component(.minute, from: Date())
        )
        
        let entry = SimpleEntry(date: Date(), timeInWords: timeInWords)
        
        completion(entry)
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<Entry>) -> Void) {
        var entries = [SimpleEntry]()
        let currentDate = Date()
        let midnight = Calendar.current.startOfDay(for: currentDate)
        let nextMidnight = Calendar.current.date(byAdding: .day, value: 1, to: midnight)!
        
        for offset in 0 ..< 60 * 24 {
            let entryDate = Calendar.current.date(byAdding: .minute, value: offset, to: midnight)!
            
            let timeInWords = timeInWords(
                h: calendar.component(.hour, from: entryDate),
                m: calendar.component(.minute, from: entryDate)
            )
            
            entries.append(SimpleEntry(date: entryDate, timeInWords: timeInWords))
        }
        
        let timeline = Timeline(entries: entries, policy: .after(nextMidnight))
        
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let timeInWords: String
}

struct WordClockWidgetView : View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: Provider.Entry
    
    @ViewBuilder
    var body: some View {
        switch family {
        case .systemSmall:
            WordClockWidgetEntryView(entry: entry)
        case .systemMedium:
            WordClockWidgetEntryView(entry: entry)
        case .systemLarge:
            WordClockWidgetEntryLargeView(entry: entry)
            
        default: WordClockWidgetEntryView(entry: entry)
        }
    }
}

struct WordClockWidgetEntryView: View {
    struct ViewState {
        var time12: String
    }
    
    var entry: Provider.Entry
    
    var viewState: ViewState?
    
    init(entry: Provider.Entry) {
        self.entry = entry
        self.viewState = nil
    }
    
    var body: some View {
        VStack {
            //Text(entry.date, style: .time)
            Text("\(entry.timeInWords.uppercased())")
                .font(.custom("Roboto-Bold", size: 16))
                .lineSpacing(8)
                .multilineTextAlignment(.center)
                .padding(8)
        }
    }
}

struct WordClockWidgetEntryLargeView : View {
    struct ViewState {
        var time12: String
    }
    
    var entry: Provider.Entry
    
    var viewState: ViewState?
    
    init(entry: Provider.Entry) {
        self.entry = entry
        self.viewState = nil
    }
    
    var body: some View {
        TimeInWordsView(
            store: Store(
                initialState: TimeInWordsState(
                    hour: .nine,
                    minutes: .five,
                    accessory: .past
                ),
                reducer: timeInWordsReducer,
                environment: .mock(
                    mainQueue: DispatchQueue.main.eraseToAnyScheduler()
                )
            )
        )
    }
}

@main
struct WordClockWidget: Widget {
    let kind: String = "WordClockWidget"
    
    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            WordClockWidgetView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}

// eight o'clock
struct WordClockWidget_Previews: PreviewProvider {
    static var previews: some View {
        WordClockWidgetEntryView(entry: SimpleEntry(date: Date(), timeInWords: "one minute to eight"))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}

struct WordClockWidget_Large_Previews: PreviewProvider {
    static var previews: some View {
        WordClockWidgetEntryLargeView(
            entry: SimpleEntry(
                date: Date(),
                timeInWords: "one minute to eight"
            )
        ).previewContext(WidgetPreviewContext(family: .systemLarge))
    }
}

