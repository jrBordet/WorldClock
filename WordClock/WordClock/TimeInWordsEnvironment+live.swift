//
//  TimeInWordsEnvironment+live.swift
//  WordClock
//
//  Created by Jean Raphael Bordet  on 24/04/22.
//

import Foundation
import ComposableArchitecture
import TimeInWords
import TimeInWordsFeature

extension TimeInWordsEnvironment {
    public static var live: Self = .init(
        mainQueue: DispatchQueue.main.eraseToAnyScheduler(),
        timeInWords: { h, m in
            Effect(value: TimeInWords.timeInWords(h: h, m: m))
        },
        time12InWords: { h, m in
            Effect(value: TimeInWords.time12InWords(h: h, m: m))
        }
    )
}


extension WidgetEnvironment {
    public static var live: Self = .init(
        backgroundQueue: DispatchQueue.main.eraseToAnyScheduler(),
        timeInWords: { value in
            UserDefaults(suiteName: "group.com.jrbordet.wordclock.contents")!.set(value, forKey: "timeInWords")
            
            return .none
        }
    )
}
