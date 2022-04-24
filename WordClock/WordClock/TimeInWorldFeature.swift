//
//  TimeInWorldFeature.swift
//  WordClock
//
//  Created by Jean Raphael Bordet  on 24/04/22.
//

import Foundation
import TimeInWords
import ComposableArchitecture

var calendar = Calendar.current

// MARK: - Timer feature domain

struct TimeInWorldState: Equatable {
    var isTimerActive = false
    var secondsElapsed = 0
    var timeInWords: String = ""
    
    var hour: WordNumber = .zero
    var minutes: WordNumber = .zero
    var accessory: Accessory = .o_clock
}

enum TimeInWordsAction {
    case timerTicked
    case toggleTimerButtonTapped
    case timeInWords, timeInWordsResponse(Result<String, Error>)
    
    case timw12InWordsResponse(Result<((hour: WordNumber, minutes: WordNumber, accessory: Accessory)), Error>)
}

struct TimeInWordsEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    var timeInWords: (Int, Int) -> Effect<String, Error>
    var time12InWords: (Int, Int) -> Effect<((hour: WordNumber, minutes: WordNumber, accessory: Accessory)), Error>
}

let timeInWordsReducer = Reducer<TimeInWorldState, TimeInWordsAction, TimeInWordsEnvironment> {
    state, action, environment in
    struct TimerId: Hashable {}
    
    switch action {
    case .toggleTimerButtonTapped:
        state.isTimerActive.toggle()
        
        return state.isTimerActive
        ? Effect.timer(id: TimerId(), every: 1, tolerance: .zero, on: environment.mainQueue)
            .map { _ in TimeInWordsAction.timerTicked }
        : Effect.cancel(id: TimerId())
    
    case .timerTicked:
        state.secondsElapsed += 1
        
        return Effect<TimeInWordsAction, Never>(value: .timeInWords)
        
    case .timeInWords:
        let date = Date()

        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        return Effect.merge(
            environment
                .timeInWords(hour, minutes)
                .receive(on: environment.mainQueue)
                .catchToEffect()
                .map { TimeInWordsAction.timeInWordsResponse($0) },
            environment
                .time12InWords(hour, minutes)
                .receive(on: environment.mainQueue)
                .catchToEffect()
                .map { TimeInWordsAction.timw12InWordsResponse($0) }
        )
                    
    case let .timeInWordsResponse(.success(time)):
        state.timeInWords = time
        return .none
                
    case let .timw12InWordsResponse(.success(value)):
        state.hour = value.hour
        state.minutes = value.minutes
        state.accessory = value.accessory
        
        return .none
        
    case let .timeInWordsResponse(.failure(error)):
        return .none
    case let .timw12InWordsResponse(.failure(error)):
        return .none
    }
}
    .signpost()
    .debug()
