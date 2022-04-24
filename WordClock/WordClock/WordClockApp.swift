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
			ContentView(
			store: Store(
			  initialState: TimeInWorldState(),
			  reducer: timeInWordsReducer,
			  environment: TimeInWordsEnvironment(
				mainQueue: DispatchQueue.main.eraseToAnyScheduler(),
                timeInWords: { (h: Int, m: Int) -> Effect<String, Error> in
                    Effect(value: timeInWords(h: h, m: m))
                },
                time12InWords: { h, m in
                    Effect(value: time12InWords(h: h, m: m))
                }
			  )
			)
		  )
        }
    }
}
