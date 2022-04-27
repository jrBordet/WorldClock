//
//  File.swift
//  
//
//  Created by Jean Raphael Bordet  on 25/04/22.
//

import SwiftUI
import ComposableArchitecture
import TimeInWords

struct TimeInWordsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TimeInWordsView(
                store:
                    Store(
                        initialState: TimeInWordsState(
                            date: Date(timeIntervalSince1970: 1650874500)
                        ),
                        reducer: timeInWordsReducer,
                        environment: .mock(
                            mainQueue: DispatchQueue.main.eraseToAnyScheduler(),
                            timeInWords: { h, m in
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
