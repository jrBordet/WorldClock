//
//  WordClockApp.swift
//  WordClock
//
//  Created by Jean Raphael Bordet on 08/03/22.
//

import SwiftUI
import ComposableArchitecture
import TimeInWords
import TimeInWorldFeature

@main
struct WordClockApp: App {
    var body: some Scene {
        WindowGroup {
            TimeInWorldView(
                store: Store(
                    initialState: TimeInWorldState(date: Date()),
                    reducer: timeInWordsReducer,
                    environment: .live
                )
            )
        }
    }
}


extension Date {
    static var quarterPastTen = Date(timeIntervalSince1970: 1650874500)
}
