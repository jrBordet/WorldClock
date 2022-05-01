//
//  TimeInWorldState.swift
//  
//
//  Created by Jean Raphael Bordet  on 26/04/22.
//

import Foundation

extension Date {
    public static var eightoClock = Date(timeIntervalSince1970: 1650780000)
    
    public static var fivePastEight = Date(timeIntervalSince1970: 1650780300)
    
    public static var tenPasteight = Date(timeIntervalSince1970: 1650780600)
    
    public static var quarterPastEight = Date(timeIntervalSince1970: 1650874500)
    
    public static var twentyPastEight = Date(timeIntervalSince1970: 1650781200)
    
    public static var twentyFivePastEight = Date(timeIntervalSince1970: 1650781500)
    
    public static var halfPastEight = Date(timeIntervalSince1970: 1650781800)
    
    public static var twentyFiveToNine = Date(timeIntervalSince1970: 1650782100)
    
    public static var twentyToNine = Date(timeIntervalSince1970: 1650782400)
    
    public static var quarterToNine = Date(timeIntervalSince1970: 1650782700)
    
    public static var tenToNine = Date(timeIntervalSince1970: 1650783000)
    
    public static var fiveToNine = Date(timeIntervalSince1970: 1650783300)
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
    
    static var tenPastEight: Self =
        .init(
            hour: .eight,
            minutes: .ten,
            accessory: .past
        )
    
    static var quarterPastEight: Self =
        .init(
            hour: .eight,
            minutes: .fifteen,
            accessory: .quarter_past
        )
    
    static var twentyPastEight: Self =
        .init(
            hour: .eight,
            minutes: .twenty,
            accessory: .past
        )
    
    static var twentyFiveEight: Self =
        .init(
            hour: .eight,
            minutes: .twenty_five,
            accessory: .past
        )
    
    static var halfPastEight: Self =
        .init(
            hour: .eight,
            minutes: .thirty,
            accessory: .half
        )
    
    static var twentyFiveToNine: Self =
        .init(
            hour: .eight,
            minutes: .twenty_five,
            accessory: .to
        )
    
    static var twentyToNine: Self =
        .init(
            hour: .eight,
            minutes: .twenty,
            accessory: .to
        )
    
    static var quarterToNine: Self =
        .init(
            hour: .eight,
            minutes: .fifteen,
            accessory: .quarter_to
        )
    
    static var tenToNine: Self =
        .init(
            hour: .eight,
            minutes: .ten,
            accessory: .to
        )
    
    static var fiveToNine: Self =
        .init(
            hour: .eight,
            minutes: .five,
            accessory: .to
        )
}
