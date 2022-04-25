//
//  TimeInWorldFeature_Preview.swift
//  WordClock
//
//  Created by Jean Raphael Bordet  on 24/04/22.
//

import Foundation
import SwiftUI
import TimeInWords
import ComposableArchitecture
import TimeInWorldFeature

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TimeInWorldView(
                store:
                    Store(
                        initialState: TimeInWorldState(
                            date: Date(timeIntervalSince1970: 1650831129)
                        ),
                        reducer: timeInWordsReducer,
                        environment: .mock(
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
