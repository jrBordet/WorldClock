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
            LetterView("F", highighted: viewStore.hour == .four)
            LetterView("O", highighted: viewStore.hour == .four)
            LetterView("U", highighted: viewStore.hour == .four)
            LetterView("R", highighted: viewStore.hour == .four)
        }
    }
}

public struct FiveView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("F", highighted: viewStore.hour == .five)
            LetterView("I", highighted: viewStore.hour == .five)
            LetterView("V", highighted: viewStore.hour == .five)
            LetterView("E", highighted: viewStore.hour == .five)
        }
    }
}

public struct TwoView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("T", highighted: viewStore.hour == .two)
            LetterView("W", highighted: viewStore.hour == .two)
            LetterView("O", highighted: viewStore.hour == .two)
        }
    }
}
