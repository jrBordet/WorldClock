//
//  File.swift
//  
//
//  Created by Jean Raphael Bordet  on 25/04/22.
//

import Foundation
import SwiftUI
import ComposableArchitecture
import TimeInWords

public struct TwentyFiveXView: View {
    let store: Store<TimeInWordsState, TimeInWordsAction>
    
    public init(
        store: Store<TimeInWordsState, TimeInWordsAction>
    ) {
        self.store = store
    }
    
    public var body: some View {
        HStack() {
            TwentyView(store: store)
            TwentyFiveView(store: store)
            LetterView("X")
        }
    }
}

public struct TwentyView: View {
    struct ViewState: Equatable {
        var highlighted: Bool
        
        public init(state: TimeInWordsState) {
            self.highlighted = state.minutes == .twenty || state.minutes == .twenty_five
        }
    }
    
    let store: Store<TimeInWordsState, TimeInWordsAction>
    @ObservedObject var viewStore: ViewStore<ViewState, TimeInWordsAction>
    
    public init(
        store: Store<TimeInWordsState, TimeInWordsAction>
    ) {
        self.store = store
        self.viewStore = ViewStore(store.scope(state: ViewState.init))
    }
    
    public var body: some View {
        HStack() {
            LetterView("T", highlighted: viewStore.highlighted)
            LetterView("W", highlighted: viewStore.highlighted)
            LetterView("E", highlighted: viewStore.highlighted)
            LetterView("N", highlighted: viewStore.highlighted)
            LetterView("T", highlighted: viewStore.highlighted)
            LetterView("Y", highlighted: viewStore.highlighted)
        }
    }
}

public struct TwentyFiveView: View {
    struct ViewState: Equatable {
        var highlighted: Bool
        
        public init(state: TimeInWordsState) {
            self.highlighted = state.minutes == .five || state.minutes == .twenty_five
        }
    }
    
    let store: Store<TimeInWordsState, TimeInWordsAction>
    @ObservedObject var viewStore: ViewStore<ViewState, TimeInWordsAction>
    
    public init(
        store: Store<TimeInWordsState, TimeInWordsAction>
    ) {
        self.store = store
        self.viewStore = ViewStore(store.scope(state: ViewState.init))
    }
    
    public var body: some View {
        HStack() {
            LetterView("F", highlighted: viewStore.highlighted)
            LetterView("I", highlighted: viewStore.highlighted)
            LetterView("V", highlighted: viewStore.highlighted)
            LetterView("E", highlighted: viewStore.highlighted)
        }
    }
}
