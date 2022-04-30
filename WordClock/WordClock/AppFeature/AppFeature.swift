//
//  AppFeature.swift
//  WordClock
//
//  Created by Jean Raphael Bordet  on 27/04/22.
//

import Foundation
import ComposableArchitecture
import TimeInWordsFeature
import TimeInWords
import SwiftUI

struct AppState: Equatable {
    var timeInWords: TimeInWordsState
    var appDelegate: AppDelegateState?
}

enum AppAction: Equatable {
    case timeInWords(TimeInWordsAction)
    case appDelegate(AppDelegateAction)

}

struct AppEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    var timeInWords: TimeInWordsEnvironment
    var widgetEnvironment: WidgetEnvironment
}

public struct WidgetEnvironment {
    var backgroundQueue: AnySchedulerOf<DispatchQueue>
    var timeInWords: (String) -> Effect<Never, Never>
    
    public init(
        backgroundQueue: AnySchedulerOf<DispatchQueue> = .immediate,
        timeInWords: @escaping(String) -> Effect<Never, Never>
    ) {
        self.backgroundQueue = backgroundQueue
        self.timeInWords = timeInWords
    }
}

struct AppView: View {
    let store: Store<AppState, AppAction>
    @ObservedObject var viewStore: ViewStore<ViewState, AppAction>
    
    struct ViewState: Equatable {
        let isActive: Bool
        
        init(state: AppState) {
            self.isActive = state.timeInWords.hour != .zero
        }
    }
    
    init(store: Store<AppState, AppAction>) {
        self.store = store
        self.viewStore = ViewStore(self.store.scope(state: ViewState.init))
    }
    
    var body: some View {
        TimeInWordsView(
            store: self.store.scope(
                state: \.timeInWords,
                action: AppAction.timeInWords
            )
        )
    }
}


struct AppCommonView: View {
    var body: some View {
        Text("shared view")
    }
}
