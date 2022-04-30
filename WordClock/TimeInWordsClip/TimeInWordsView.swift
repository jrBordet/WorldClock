//
//  ContentView.swift
//  TimeInWordsClip
//
//  Created by Jean Raphael Bordet  on 29/04/22.
//

import Foundation
import ComposableArchitecture
import TimeInWordsFeature
import TimeInWords
import SwiftUI

extension TimeInWordsEnvironment {
    public static var clip: Self = .init(
        mainQueue: DispatchQueue.main.eraseToAnyScheduler(),
        timeInWords: { h, m in
            Effect(value: TimeInWords.timeInWords(h: h, m: m))
        },
        time12InWords: { h, m in
            Effect(value: TimeInWords.time12InWords(h: h, m: m))
        }
    )
}

let appClipStore: Store<TimeInWordsState, TimeInWordsAction> = .init(
    initialState: .init(),
    reducer: timeInWordsReducer,
    environment: .clip
)

struct ContentView: View {
    var body: some View {
        TimeInWordsView(
            store: appClipStore
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimeInWordsView(
            store: Store(
                initialState: .eightOClock,
                reducer: timeInWordsReducer,
                environment: .mock(
                    mainQueue: DispatchQueue.main.eraseToAnyScheduler()
                )
            )
        )
    }
}

extension TimeInWordsState {
    static var eightOClock: Self =
        .init(
            hour: .eight,
            minutes: .zero,
            accessory: .o_clock
        )
    
    static var fivePastEight: Self =
        .init(
            hour: .eight,
            minutes: .five,
            accessory: .past
        )
}
