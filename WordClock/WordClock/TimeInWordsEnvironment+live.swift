//
//  TimeInWordsEnvironment+live.swift
//  WordClock
//
//  Created by Jean Raphael Bordet  on 24/04/22.
//

import Foundation
import ComposableArchitecture
import TimeInWords
import TimeInWorldFeature

extension TimeInWordsEnvironment {
    public static var live: Self = .init(
        mainQueue: DispatchQueue.main.eraseToAnyScheduler(),
        timeInWords: { h, m in
            Effect(value: timeInWords(h: h, m: m))
        },
        time12InWords: { h, m in
            Effect(value: time12InWords(h: h, m: m))
        }
    )
}

