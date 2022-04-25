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
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            SevenView(viewStore: viewStore)
            TwelveView(viewStore: viewStore)
        }
    }
}

public struct SevenView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("S", highighted: viewStore.hour == .seven)
            LetterView("E", highighted: viewStore.hour == .seven)
            LetterView("V", highighted: viewStore.hour == .seven)
            LetterView("E", highighted: viewStore.hour == .seven)
            LetterView("N", highighted: viewStore.hour == .seven)
        }
    }
}

public struct TwelveView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("T", highighted: viewStore.hour == .twelve)
            LetterView("W", highighted: viewStore.hour == .twelve)
            LetterView("E", highighted: viewStore.hour == .twelve)
            LetterView("L", highighted: viewStore.hour == .twelve)
            LetterView("V", highighted: viewStore.hour == .twelve)
            LetterView("E", highighted: viewStore.hour == .twelve)
        }
    }
}
