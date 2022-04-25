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
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            EightView(viewStore: viewStore)
            ElevenView(viewStore: viewStore)
        }
    }
}

public struct EightView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("E", highighted: viewStore.hour == .eight)
            LetterView("I", highighted: viewStore.hour == .eight)
            LetterView("G", highighted: viewStore.hour == .eight)
            LetterView("H", highighted: viewStore.hour == .eight)
            LetterView("T", highighted: viewStore.hour == .eight)
        }
    }
}

public struct ElevenView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("E", highighted: viewStore.hour == .eleven)
            LetterView("L", highighted: viewStore.hour == .eleven)
            LetterView("E", highighted: viewStore.hour == .eleven)
            LetterView("V", highighted: viewStore.hour == .eleven)
            LetterView("E", highighted: viewStore.hour == .eleven)
            LetterView("N", highighted: viewStore.hour == .eleven)
        }
    }
}
