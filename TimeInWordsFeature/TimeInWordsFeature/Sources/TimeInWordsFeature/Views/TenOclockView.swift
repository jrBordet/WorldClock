//
//  TenOclockView.swift
//  
//
//  Created by Jean Raphael Bordet  on 25/04/22.
//

import Foundation
import SwiftUI
import ComposableArchitecture

public struct TenOClockView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWordsState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            TenOView(viewStore: viewStore)
            LetterView("S")
            OClockView(viewStore: viewStore)
        }
    }
}

public struct TenOView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWordsState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("T", highlighted: viewStore.hour == .ten)
            LetterView("E", highlighted: viewStore.hour == .ten)
            LetterView("N", highlighted: viewStore.hour == .ten)
        }
    }
}

public struct OClockView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWordsState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("O", highlighted: viewStore.accessory == .o_clock)
            LetterView("'", highlighted: viewStore.accessory == .o_clock)
            LetterView("C", highlighted: viewStore.accessory == .o_clock)
            LetterView("L", highlighted: viewStore.accessory == .o_clock)
            LetterView("O", highlighted: viewStore.accessory == .o_clock)
            LetterView("C", highlighted: viewStore.accessory == .o_clock)
            LetterView("K", highlighted: viewStore.accessory == .o_clock)
        }
    }
}
