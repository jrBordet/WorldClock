//
//  PastNineView.swift
//  
//
//  Created by Jean Raphael Bordet  on 25/04/22.
//

import Foundation
import SwiftUI
import ComposableArchitecture

public struct PastNineView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWordsState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            PastView(viewStore: viewStore)
            LetterView("E")
            LetterView("R")
            LetterView("U")
            NineView(viewStore: viewStore)
        }
    }
}

public struct PastView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWordsState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("P", highlighted: viewStore.accessory == .past || viewStore.accessory == .quarter_past || viewStore.accessory == .half)
            LetterView("A", highlighted: viewStore.accessory == .past || viewStore.accessory == .quarter_past || viewStore.accessory == .half)
            LetterView("S", highlighted: viewStore.accessory == .past || viewStore.accessory == .quarter_past || viewStore.accessory == .half)
            LetterView("T", highlighted: viewStore.accessory == .past || viewStore.accessory == .quarter_past || viewStore.accessory == .half)
        }
    }
}

public struct NineView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWordsState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("N", highlighted: viewStore.hour == .nine)
            LetterView("I", highlighted: viewStore.hour == .nine)
            LetterView("N", highlighted: viewStore.hour == .nine)
            LetterView("E", highlighted: viewStore.hour == .nine)
        }
    }
}
