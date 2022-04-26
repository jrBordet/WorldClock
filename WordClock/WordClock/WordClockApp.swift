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
