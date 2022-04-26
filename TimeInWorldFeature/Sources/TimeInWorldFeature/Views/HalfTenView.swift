//
//  File.swift
//  
//
//  Created by Jean Raphael Bordet  on 25/04/22.
//

import Foundation
import SwiftUI
import ComposableArchitecture

public struct HalfTenToView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            HalfView(viewStore: viewStore)
            LetterView("B")
            TenView(viewStore: viewStore)
            LetterView("F")
            ToView(viewStore: viewStore)
        }
    }
}

public struct HalfView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("H", highlighted: viewStore.accessory == .half)
            LetterView("A", highlighted: viewStore.accessory == .half)
            LetterView("L", highlighted: viewStore.accessory == .half)
            LetterView("F", highlighted: viewStore.accessory == .half)
        }
    }
}

public struct TenView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("T", highlighted: viewStore.minutes == .ten)
            LetterView("E", highlighted: viewStore.minutes == .ten)
            LetterView("N", highlighted: viewStore.minutes == .ten)
        }
    }
}

public struct ToView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("T", highlighted: viewStore.accessory == .to || viewStore.accessory == .quarter_to)
            LetterView("O", highlighted: viewStore.accessory == .to || viewStore.accessory == .quarter_to)
        }
    }
}

