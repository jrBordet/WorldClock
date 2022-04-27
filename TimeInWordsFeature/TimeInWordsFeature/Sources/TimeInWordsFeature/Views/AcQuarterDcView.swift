//
//  File.swift
//  
//
//  Created by Jean Raphael Bordet  on 25/04/22.
//

import Foundation
import SwiftUI
import ComposableArchitecture

public struct AcView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWordsState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("A", highlighted: viewStore.accessory == .quarter_past)
            LetterView("C")
        }
    }
}

public struct QuarterView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWordsState, TimeInWordsAction>
    
    public var body: some View {
        HStack() {
            LetterView("Q", highlighted: viewStore.accessory == .quarter_past || viewStore.accessory == .quarter_to)
            LetterView("U", highlighted: viewStore.accessory == .quarter_past || viewStore.accessory == .quarter_to)
            LetterView("A", highlighted: viewStore.accessory == .quarter_past || viewStore.accessory == .quarter_to)
            LetterView("R", highlighted: viewStore.accessory == .quarter_past || viewStore.accessory == .quarter_to)
            LetterView("T", highlighted: viewStore.accessory == .quarter_past || viewStore.accessory == .quarter_to)
            LetterView("E", highlighted: viewStore.accessory == .quarter_past || viewStore.accessory == .quarter_to)
            LetterView("R", highlighted: viewStore.accessory == .quarter_past || viewStore.accessory == .quarter_to)
        }
    }
}

public struct DcView: View {
    public var body: some View {
        HStack() {
            LetterView("D")
            LetterView("C")
        }
    }
}

public struct AcQuarterDcView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWordsState, TimeInWordsAction>
    
    public var body: some View {
        HStack {
            AcView(viewStore: viewStore)
            QuarterView(viewStore: viewStore)
            DcView()
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}
