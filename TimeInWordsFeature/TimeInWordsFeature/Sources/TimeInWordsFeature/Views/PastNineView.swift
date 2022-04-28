//
//  PastNineView.swift
//  
//
//  Created by Jean Raphael Bordet  on 25/04/22.
//

import Foundation
import SwiftUI
import ComposableArchitecture
import TimeInWords

public struct PastNineView: View {
    let store: Store<TimeInWordsState, TimeInWordsAction>
    
    public init(
        store: Store<TimeInWordsState, TimeInWordsAction>
    ) {
        self.store = store
    }
    
    public var body: some View {
        HStack() {
            PastView(store: store)
            LetterView("E")
            LetterView("R")
            LetterView("U")
            NineView(store: store)
        }
    }
}

public struct PastView: View {
    struct ViewState: Equatable {
        var highlighted: Bool
        
        public init(state: TimeInWordsState) {
            self.highlighted = state.accessory == .past || state.accessory == .quarter_past || state.accessory == .half
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
            LetterView("P", highlighted: viewStore.highlighted)
            LetterView("A", highlighted: viewStore.highlighted)
            LetterView("S", highlighted: viewStore.highlighted)
            LetterView("T", highlighted: viewStore.highlighted)
        }
    }
}

public struct NineView: View {
    struct ViewState: Equatable {
        var highlighted: Bool
        
        public init(state: TimeInWordsState) {
            self.highlighted = state.hour == .nine
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
            LetterView("N", highlighted: viewStore.highlighted)
            LetterView("I", highlighted: viewStore.highlighted)
            LetterView("N", highlighted: viewStore.highlighted)
            LetterView("E", highlighted: viewStore.highlighted)
        }
    }
}
