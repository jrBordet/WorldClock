//
//  FourFiveTwoView.swift
//  
//
//  Created by Jean Raphael Bordet  on 25/04/22.
//

import Foundation
import SwiftUI
import ComposableArchitecture
import TimeInWords

public struct FourFiveTwoView: View {
    let store: Store<TimeInWordsState, TimeInWordsAction>
    
    public init(
        store: Store<TimeInWordsState, TimeInWordsAction>
    ) {
        self.store = store
    }
    
    public var body: some View {
        HStack() {
            FourView(store: store)
            FiveView(store: store)
            TwoView(store: store)
        }
    }
}

public struct FourView: View {
    struct ViewState: Equatable {
        var highlighted: Bool
        
        public init(state: TimeInWordsState) {
            self.highlighted = state.hour == .four
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
            LetterView("O", highlighted: viewStore.highlighted)
            LetterView("U", highlighted: viewStore.highlighted)
            LetterView("R", highlighted: viewStore.highlighted)
        }
    }
}

public struct FiveView: View {
    struct ViewState: Equatable {
        var highlighted: Bool
        
        public init(state: TimeInWordsState) {
            self.highlighted = state.hour == .five
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

public struct TwoView: View {
    struct ViewState: Equatable {
        var highlighted: Bool
        
        public init(state: TimeInWordsState) {
            self.highlighted = state.hour == .two
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
            LetterView("O", highlighted: viewStore.highlighted)
        }
    }
}
