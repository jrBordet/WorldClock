//
//  WordClockApp.swift
//  WordClock
//
//  Created by Jean Raphael Bordet on 08/03/22.
//

import SwiftUI
import ComposableArchitecture
import TimeInWords

@main
struct WordClockApp: App {
    var body: some Scene {
        WindowGroup {
			ContentView(
			store: Store(
			  initialState: TimersState(),
			  reducer: timersReducer,
			  environment: TimersEnvironment(
				mainQueue: DispatchQueue.main.eraseToAnyScheduler(),
                timeInWords: { (h: Int, m: Int) -> Effect<String, Error> in
                    Effect(value: timeInWords(h: h, m: m))
                }
			  )
			)
		  )
        }
    }
}
