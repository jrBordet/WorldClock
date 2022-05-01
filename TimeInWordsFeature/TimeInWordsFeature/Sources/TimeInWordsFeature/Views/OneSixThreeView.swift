//
//  OneSixThreeView.swift
//  
//
//  Created by Jean Raphael Bordet  on 25/04/22.
//

import Foundation
import SwiftUI
import ComposableArchitecture
import TimeInWords

public struct OneSixThreeView: View {
    let store: Store<TimeInWordsState, TimeInWordsAction>
    
    public init(
        store: Store<TimeInWordsState, TimeInWordsAction>
    ) {
        self.store = store
    }
    
    public var body: some View {
        HStack() {
            OneView(store: store)
            SixView(store: store)
            ThreeView(store: store)
        }
    }
}

public struct OneView: View {
    struct ViewState: Equatable {
        var highlighted: Bool
        
        public init(state: TimeInWordsState) {
            self.highlighted = state.hour == .one
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
            LetterView("O", highlighted: viewStore.highlighted)
            LetterView("N", highlighted: viewStore.highlighted)
            LetterView("E", highlighted: viewStore.highlighted)
        }
    }
}

public struct SixView: View {
    struct ViewState: Equatable {
        var highlighted: Bool
        
        public init(state: TimeInWordsState) {
            self.highlighted = state.hour == .six
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
            LetterView("S", highlighted: viewStore.highlighted)
            LetterView("I", highlighted: viewStore.highlighted)
            LetterView("X", highlighted: viewStore.highlighted)
        }
    }
}

public struct ThreeView: View {
    struct ViewState: Equatable {
        var highlighted: Bool
        
        public init(state: TimeInWordsState) {
            self.highlighted = state.hour == .three
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
            LetterView("H", highlighted: viewStore.highlighted)
            LetterView("R", highlighted: viewStore.highlighted)
            LetterView("E", highlighted: viewStore.highlighted)
            LetterView("E", highlighted: viewStore.highlighted)
        }
    }
}



