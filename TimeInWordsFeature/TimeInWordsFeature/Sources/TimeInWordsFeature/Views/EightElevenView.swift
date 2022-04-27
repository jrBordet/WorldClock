//
//  EightElevenView.swift
//  
//
//  Created by Jean Raphael Bordet  on 25/04/22.
//

import Foundation
import SwiftUI
import ComposableArchitecture

public struct EightElevenView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWordsState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            EightView(viewStore: viewStore)
            ElevenView(viewStore: viewStore)
        }
    }
}

public struct EightView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWordsState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("E", highlighted: viewStore.hour == .eight)
            LetterView("I", highlighted: viewStore.hour == .eight)
            LetterView("G", highlighted: viewStore.hour == .eight)
            LetterView("H", highlighted: viewStore.hour == .eight)
            LetterView("T", highlighted: viewStore.hour == .eight)
        }
    }
}

public struct ElevenView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWordsState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("E", highlighted: viewStore.hour == .eleven)
            LetterView("L", highlighted: viewStore.hour == .eleven)
            LetterView("E", highlighted: viewStore.hour == .eleven)
            LetterView("V", highlighted: viewStore.hour == .eleven)
            LetterView("E", highlighted: viewStore.hour == .eleven)
            LetterView("N", highlighted: viewStore.hour == .eleven)
        }
    }
}
