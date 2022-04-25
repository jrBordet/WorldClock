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
    static var eightoClock = Date(timeIntervalSince1970: 1650780000)
    
    static var fivePastEight = Date(timeIntervalSince1970: 1650780300)
    
    static var tenPasteight = Date(timeIntervalSince1970: 1650780600)

    static var quarterPastEight = Date(timeIntervalSince1970: 1650874500)
    
    static var twentyPastEight = Date(timeIntervalSince1970: 1650781200)
    
    static var twentyFivePastEight = Date(timeIntervalSince1970: 1650781500)
    
    // check this, the sdk should return hour: eight, and past is missing
    static var halfPastEight = Date(timeIntervalSince1970: 1650781800)
    
    static var twentyFiveToNine = Date(timeIntervalSince1970: 1650782100)
    
    static var twentyToNine = Date(timeIntervalSince1970: 1650782400)

    static var quarterToNine = Date(timeIntervalSince1970: 1650782700)
    
    static var tenToNine = Date(timeIntervalSince1970: 1650783000)
    
    static var fiveToNine = Date(timeIntervalSince1970: 1650783300)
}
