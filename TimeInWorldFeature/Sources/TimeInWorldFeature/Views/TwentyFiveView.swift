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
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            TwentyView(viewStore: viewStore)
            TwentyFiveView(viewStore: viewStore)
            LetterView("X")
        }
    }
}

public struct TwentyView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("T", highighted: viewStore.minutes == .twenty || viewStore.minutes == .twenty_five)
            LetterView("W", highighted: viewStore.minutes == .twenty || viewStore.minutes == .twenty_five)
            LetterView("E", highighted: viewStore.minutes == .twenty || viewStore.minutes == .twenty_five)
            LetterView("N", highighted: viewStore.minutes == .twenty || viewStore.minutes == .twenty_five)
            LetterView("T", highighted: viewStore.minutes == .twenty || viewStore.minutes == .twenty_five)
            LetterView("Y", highighted: viewStore.minutes == .twenty || viewStore.minutes == .twenty_five)
        }
    }
}

public struct TwentyFiveView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("F", highighted: viewStore.minutes == .five || viewStore.minutes == .twenty_five)
            LetterView("I", highighted: viewStore.minutes == .five || viewStore.minutes == .twenty_five)
            LetterView("V", highighted: viewStore.minutes == .five || viewStore.minutes == .twenty_five)
            LetterView("E", highighted: viewStore.minutes == .five || viewStore.minutes == .twenty_five)
        }
    }
}
