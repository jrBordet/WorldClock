//
//  TimeInWorldFeature.swift
//  WordClock
//
//  Created by Jean Raphael Bordet  on 24/04/22.
//

import Foundation
import TimeInWords
import ComposableArchitecture

public struct Error: Swift.Error, Equatable {
    public init() {}
}

var calendar = Calendar.current

// MARK: - Timer feature domain

public struct TimeInWordsState: Equatable {
    public var date = Date()
    public var isTimerActive = false
    public var secondsElapsed = 0
    public var timeInWords: String = ""
    
    public var hour: WordNumber = .zero
    public var minutes: WordNumber = .zero
    public var accessory: Accessory = .o_clock
    
    public init(
        date: Date = Date(),
        hour: WordNumber = .zero,
        minutes: WordNumber = .zero,
        accessory: Accessory = .o_clock
    ) {
        self.date = date
        self.hour = hour
        self.minutes = minutes
        self.accessory = accessory
    }
}

public enum TimeInWordsAction: Equatable {
    case timerTicked
    case didFinishLaunchingWithOptions
    case startTimer
    case toggleTimerButtonTapped
    case timeInWords, timeInWordsResponse(Result<String, Error>)
    
    case timw12InWordsResponse(Result<TimeIn12Components, Error>)
}

public struct TimeInWordsEnvironment {
    public var mainQueue: AnySchedulerOf<DispatchQueue>
    public var timeInWords: (Int, Int) -> Effect<String, Error>
    public var time12InWords: (Int, Int) -> Effect<TimeIn12Components, Error>
    
    public init(
        mainQueue: AnySchedulerOf<DispatchQueue>,
        timeInWords: @escaping(Int, Int) -> Effect<String, Error>,
        time12InWords: @escaping(Int, Int) -> Effect<TimeIn12Components, Error>
    ) {
        self.mainQueue = mainQueue
        self.timeInWords = timeInWords
        self.time12InWords = time12InWords
    }
}

extension TimeInWordsEnvironment {
    public static func mock (
        mainQueue: AnySchedulerOf<DispatchQueue>,
        timeInWords: @escaping(Int, Int) -> Effect<String, Error> = { _, _ in fatalError() },
        time12InWords: @escaping(Int, Int) -> Effect<TimeIn12Components, Error> = { _, _ in fatalError() }
    ) -> Self {
        .init(
            mainQueue: mainQueue,
            timeInWords: timeInWords,
            time12InWords: time12InWords
        )
    }
}

public let timeInWordsReducer = Reducer<TimeInWordsState, TimeInWordsAction, TimeInWordsEnvironment> {
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
        var dateComponent = DateComponents()
        dateComponent.second = 1
                
//        state.date = Calendar.current.date(byAdding: dateComponent, to: state.date) ?? Date()
        
        state.date = Date()
        
        state.secondsElapsed += 1
        
        return Effect<TimeInWordsAction, Never>(value: .timeInWords)
        
    case .didFinishLaunchingWithOptions:
        state.date = Date()
                
        return Effect<TimeInWordsAction, Never>(value: .timeInWords)
        
    case .timeInWords:
        let hour = calendar.component(.hour, from: state.date)
        let minutes = calendar.component(.minute, from: state.date)
        
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
        
    case .startTimer:
        state.date = Date()

        return Effect.timer(id: TimerId(), every: 1, tolerance: .zero, on: environment.mainQueue)
            .map { _ in TimeInWordsAction.timerTicked }
    }
}
    .signpost()
    .debug()
