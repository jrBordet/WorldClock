//
//  AppDelegateFeature.swift
//  WordClock
//
//  Created by Jean Raphael Bordet  on 27/04/22.
//

import Foundation
import ComposableArchitecture
import TimeInWordsFeature
import TimeInWords

struct AppDelegateState: Equatable {
    
}

enum AppDelegateAction: Equatable {
  case didFinishLaunching
}

struct AppDelegateEnvironment {
}

let appDelegateReducer = Reducer<
    AppDelegateState, AppDelegateAction, AppDelegateEnvironment
> { state, action, environment in
    switch action {
    case .didFinishLaunching:
        return .none
    }
}
