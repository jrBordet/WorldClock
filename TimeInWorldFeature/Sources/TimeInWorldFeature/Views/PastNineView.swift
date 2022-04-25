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
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

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
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("P", highighted: viewStore.accessory == .past || viewStore.accessory == .quarter_past || viewStore.accessory == .half)
            LetterView("A", highighted: viewStore.accessory == .past || viewStore.accessory == .quarter_past || viewStore.accessory == .half)
            LetterView("S", highighted: viewStore.accessory == .past || viewStore.accessory == .quarter_past || viewStore.accessory == .half)
            LetterView("T", highighted: viewStore.accessory == .past || viewStore.accessory == .quarter_past || viewStore.accessory == .half)
        }
    }
}

public struct NineView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("N", highighted: viewStore.hour == .nine)
            LetterView("I", highighted: viewStore.hour == .nine)
            LetterView("N", highighted: viewStore.hour == .nine)
            LetterView("E", highighted: viewStore.hour == .nine)
        }
    }
}
