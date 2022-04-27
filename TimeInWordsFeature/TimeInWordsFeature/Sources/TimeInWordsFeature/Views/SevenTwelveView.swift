//
//  SevenTwelveView.swift
//  
//
//  Created by Jean Raphael Bordet  on 25/04/22.
//

import Foundation
import SwiftUI
import ComposableArchitecture

public struct SevenTwelveView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWordsState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            SevenView(viewStore: viewStore)
            TwelveView(viewStore: viewStore)
        }
    }
}

public struct SevenView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWordsState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("S", highlighted: viewStore.hour == .seven)
            LetterView("E", highlighted: viewStore.hour == .seven)
            LetterView("V", highlighted: viewStore.hour == .seven)
            LetterView("E", highlighted: viewStore.hour == .seven)
            LetterView("N", highlighted: viewStore.hour == .seven)
        }
    }
}

public struct TwelveView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWordsState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("T", highlighted: viewStore.hour == .twelve)
            LetterView("W", highlighted: viewStore.hour == .twelve)
            LetterView("E", highlighted: viewStore.hour == .twelve)
            LetterView("L", highlighted: viewStore.hour == .twelve)
            LetterView("V", highlighted: viewStore.hour == .twelve)
            LetterView("E", highlighted: viewStore.hour == .twelve)
        }
    }
}
