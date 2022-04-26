//
//  FourFiveTwoView.swift
//  
//
//  Created by Jean Raphael Bordet  on 25/04/22.
//

import Foundation
import SwiftUI
import ComposableArchitecture

public struct FourFiveTwoView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            FourView(viewStore: viewStore)
            FiveView(viewStore: viewStore)
            TwoView(viewStore: viewStore)
        }
    }
}

public struct FourView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("F", highlighted: viewStore.hour == .four)
            LetterView("O", highlighted: viewStore.hour == .four)
            LetterView("U", highlighted: viewStore.hour == .four)
            LetterView("R", highlighted: viewStore.hour == .four)
        }
    }
}

public struct FiveView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("F", highlighted: viewStore.hour == .five)
            LetterView("I", highlighted: viewStore.hour == .five)
            LetterView("V", highlighted: viewStore.hour == .five)
            LetterView("E", highlighted: viewStore.hour == .five)
        }
    }
}

public struct TwoView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("T", highlighted: viewStore.hour == .two)
            LetterView("W", highlighted: viewStore.hour == .two)
            LetterView("O", highlighted: viewStore.hour == .two)
        }
    }
}
