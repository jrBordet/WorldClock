//
//  OneSixThreeView.swift
//  
//
//  Created by Jean Raphael Bordet  on 25/04/22.
//

import Foundation
import SwiftUI
import ComposableArchitecture

public struct OneSixThreeView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            OneView(viewStore: viewStore)
            SixView(viewStore: viewStore)
            ThreeView(viewStore: viewStore)
        }
    }
}

public struct OneView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("O", highlighted: viewStore.hour == .one)
            LetterView("N", highlighted: viewStore.hour == .one)
            LetterView("E", highlighted: viewStore.hour == .one)
        }
    }
}

public struct SixView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("S", highlighted: viewStore.hour == .six)
            LetterView("I", highlighted: viewStore.hour == .six)
            LetterView("X", highlighted: viewStore.hour == .six)
        }
    }
}

public struct ThreeView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("T", highlighted: viewStore.hour == .three)
            LetterView("H", highlighted: viewStore.hour == .three)
            LetterView("R", highlighted: viewStore.hour == .three)
            LetterView("E", highlighted: viewStore.hour == .three)
            LetterView("E", highlighted: viewStore.hour == .three)
        }
    }
}



