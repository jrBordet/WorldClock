//
//  EightElevenView.swift
//  
//
//  Created by Jean Raphael Bordet  on 25/04/22.
//

import Foundation
import SwiftUI
import ComposableArchitecture
import TimeInWords

public struct EightElevenView: View {
    let store: Store<TimeInWordsState, TimeInWordsAction>
    
    public init(
        store: Store<TimeInWordsState, TimeInWordsAction>
    ) {
        self.store = store
    }
    
    public var body: some View {
        HStack() {
            EightView(store: store)
            ElevenView(store: store)
        }
    }
}

public struct EightView: View {
    struct ViewState: Equatable {
        var highlighted: Bool
        
        public init(state: TimeInWordsState) {
            self.highlighted = state.hour == .eight
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
            LetterView("E", highlighted: viewStore.highlighted)
            LetterView("I", highlighted: viewStore.highlighted)
            LetterView("G", highlighted: viewStore.highlighted)
            LetterView("H", highlighted: viewStore.highlighted)
            LetterView("T", highlighted: viewStore.highlighted)
        }
    }
}

public struct ElevenView: View {
    struct ViewState: Equatable {
        var highlighted: Bool
        
        public init(state: TimeInWordsState) {
            self.highlighted = state.hour == .eleven
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
            LetterView("E", highlighted: viewStore.highlighted)
            LetterView("L", highlighted: viewStore.highlighted)
            LetterView("E", highlighted: viewStore.highlighted)
            LetterView("V", highlighted: viewStore.highlighted)
            LetterView("E", highlighted: viewStore.highlighted)
            LetterView("N", highlighted: viewStore.highlighted)
        }
    }
}
