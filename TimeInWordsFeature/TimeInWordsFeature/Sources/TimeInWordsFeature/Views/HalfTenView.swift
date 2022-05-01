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

public struct HalfTenToView: View {
    let store: Store<TimeInWordsState, TimeInWordsAction>
    
    public init(
        store: Store<TimeInWordsState, TimeInWordsAction>
    ) {
        self.store = store
    }
    
    public var body: some View {
        HStack() {
            HalfView(store: store)
            LetterView("B")
            TenView(store: store)
            LetterView("F")
            ToView(store: store)
        }
    }
}

public struct HalfView: View {
    struct ViewState: Equatable {
        var highlighted: Bool
        
        public init(state: TimeInWordsState) {
            self.highlighted = state.accessory == .half
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
            LetterView("H", highlighted: viewStore.highlighted)
            LetterView("A", highlighted: viewStore.highlighted)
            LetterView("L", highlighted: viewStore.highlighted)
            LetterView("F", highlighted: viewStore.highlighted)
        }
    }
}

public struct TenView: View {
    struct ViewState: Equatable {
        var highlighted: Bool
        
        public init(state: TimeInWordsState) {
            self.highlighted = state.minutes == .ten
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
            LetterView("E", highlighted: viewStore.highlighted)
            LetterView("N", highlighted: viewStore.highlighted)
        }
    }
}

public struct ToView: View {
    struct ViewState: Equatable {
        var highlighted: Bool
        
        public init(state: TimeInWordsState) {
            self.highlighted = state.accessory == .to || state.accessory == .quarter_to
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
            LetterView("O", highlighted: viewStore.highlighted)
        }
    }
}

