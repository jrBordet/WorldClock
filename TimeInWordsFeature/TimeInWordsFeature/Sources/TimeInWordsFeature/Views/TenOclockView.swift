//
//  TenOclockView.swift
//  
//
//  Created by Jean Raphael Bordet  on 25/04/22.
//

import Foundation
import SwiftUI
import ComposableArchitecture
import TimeInWords

public struct TenOClockView: View {
    let store: Store<TimeInWordsState, TimeInWordsAction>
    
    public init(
        store: Store<TimeInWordsState, TimeInWordsAction>
    ) {
        self.store = store
    }

    public var body: some View {
        HStack() {
            TenOView(store: store)
            LetterView("S")
            OClockView(store: store)
        }
    }
}

public struct TenOView: View {
    struct ViewState: Equatable {
        var highlighted: Bool
        
        public init(state: TimeInWordsState) {
            self.highlighted = state.hour == .ten
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

public struct OClockView: View {
    struct ViewState: Equatable {
        var highlighted: Bool
        
        public init(state: TimeInWordsState) {
            self.highlighted = state.accessory == .o_clock
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
            LetterView("'", highlighted: viewStore.highlighted)
            LetterView("C", highlighted: viewStore.highlighted)
            LetterView("L", highlighted: viewStore.highlighted)
            LetterView("O", highlighted: viewStore.highlighted)
            LetterView("C", highlighted: viewStore.highlighted)
            LetterView("K", highlighted: viewStore.highlighted)
        }
    }
}
