//
//  File.swift
//  
//
//  Created by Jean Raphael Bordet  on 25/04/22.
//

import Foundation
import SwiftUI
import ComposableArchitecture

public struct TwentyFiveXView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWordsState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            TwentyView(viewStore: viewStore)
            TwentyFiveView(viewStore: viewStore)
            LetterView("X")
        }
    }
}

public struct TwentyView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWordsState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("T", highlighted: viewStore.minutes == .twenty || viewStore.minutes == .twenty_five)
            LetterView("W", highlighted: viewStore.minutes == .twenty || viewStore.minutes == .twenty_five)
            LetterView("E", highlighted: viewStore.minutes == .twenty || viewStore.minutes == .twenty_five)
            LetterView("N", highlighted: viewStore.minutes == .twenty || viewStore.minutes == .twenty_five)
            LetterView("T", highlighted: viewStore.minutes == .twenty || viewStore.minutes == .twenty_five)
            LetterView("Y", highlighted: viewStore.minutes == .twenty || viewStore.minutes == .twenty_five)
        }
    }
}

public struct TwentyFiveView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWordsState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("F", highlighted: viewStore.minutes == .five || viewStore.minutes == .twenty_five)
            LetterView("I", highlighted: viewStore.minutes == .five || viewStore.minutes == .twenty_five)
            LetterView("V", highlighted: viewStore.minutes == .five || viewStore.minutes == .twenty_five)
            LetterView("E", highlighted: viewStore.minutes == .five || viewStore.minutes == .twenty_five)
        }
    }
}
