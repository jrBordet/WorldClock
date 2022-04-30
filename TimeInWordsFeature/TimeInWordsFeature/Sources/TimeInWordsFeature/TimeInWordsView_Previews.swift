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

struct TimeInWordsView_fivePastEight_Previews: PreviewProvider {
    static var previews: some View {
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
