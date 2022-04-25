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
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            TenOView(viewStore: viewStore)
            LetterView("S")
            OClockView(viewStore: viewStore)
        }
    }
}

public struct TenOView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("T", highighted: viewStore.hour == .ten)
            LetterView("E", highighted: viewStore.hour == .ten)
            LetterView("N", highighted: viewStore.hour == .ten)
        }
    }
}

public struct OClockView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("O", highighted: viewStore.accessory == .o_clock)
            LetterView("'", highighted: viewStore.accessory == .o_clock)
            LetterView("C", highighted: viewStore.accessory == .o_clock)
            LetterView("L", highighted: viewStore.accessory == .o_clock)
            LetterView("O", highighted: viewStore.accessory == .o_clock)
            LetterView("C", highighted: viewStore.accessory == .o_clock)
            LetterView("K", highighted: viewStore.accessory == .o_clock)
        }
    }
}
