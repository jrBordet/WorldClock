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
            LetterView("O", highighted: viewStore.hour == .one)
            LetterView("N", highighted: viewStore.hour == .one)
            LetterView("E", highighted: viewStore.hour == .one)
        }
    }
}

public struct SixView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("S", highighted: viewStore.hour == .six)
            LetterView("I", highighted: viewStore.hour == .six)
            LetterView("X", highighted: viewStore.hour == .six)
        }
    }
}

public struct ThreeView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("T", highighted: viewStore.hour == .three)
            LetterView("H", highighted: viewStore.hour == .three)
            LetterView("R", highighted: viewStore.hour == .three)
            LetterView("E", highighted: viewStore.hour == .three)
            LetterView("E", highighted: viewStore.hour == .three)
        }
    }
}



