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

public struct AcView: View {
    struct ViewState: Equatable {
        var highlighted: Bool
        
        public init(state: TimeInWordsState) {
            self.highlighted = state.accessory == .quarter_past
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
            LetterView("A", highlighted: viewStore.highlighted)
            LetterView("C")
        }
    }
}

public struct QuarterView: View {
    struct ViewState: Equatable {
        var highlighted: Bool
        
        public init(state: TimeInWordsState) {
            self.highlighted = state.accessory == .quarter_past || state.accessory == .quarter_to
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
            LetterView("Q", highlighted: viewStore.highlighted)
            LetterView("U", highlighted: viewStore.highlighted)
            LetterView("A", highlighted: viewStore.highlighted)
            LetterView("R", highlighted: viewStore.highlighted)
            LetterView("T", highlighted: viewStore.highlighted)
            LetterView("E", highlighted: viewStore.highlighted)
            LetterView("R", highlighted: viewStore.highlighted)
        }
    }
}

public struct DcView: View {
    public var body: some View {
        HStack() {
            LetterView("D")
            LetterView("C")
        }
    }
}

public struct AcQuarterDcView: View {
    let store: Store<TimeInWordsState, TimeInWordsAction>
    
    public init(
        store: Store<TimeInWordsState, TimeInWordsAction>
    ) {
        self.store = store
    }
    
    public var body: some View {
        HStack {
            AcView(store: store)
            QuarterView(store: store)
            DcView()
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}
