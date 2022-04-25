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
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public var body: some View {
        HStack() {
            LetterView("A", highighted: viewStore.accessory == .quarter_past)
            LetterView("C")
        }
    }
}

public struct QuarterView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>
    
    public var body: some View {
        HStack() {
            LetterView("Q", highighted: viewStore.accessory == .quarter_past)
            LetterView("U", highighted: viewStore.accessory == .quarter_past)
            LetterView("A", highighted: viewStore.accessory == .quarter_past)
            LetterView("R", highighted: viewStore.accessory == .quarter_past)
            LetterView("T", highighted: viewStore.accessory == .quarter_past)
            LetterView("E", highighted: viewStore.accessory == .quarter_past)
            LetterView("R", highighted: viewStore.accessory == .quarter_past)
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
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>
    
    public var body: some View {
        HStack {
            AcView(viewStore: viewStore)
            QuarterView(viewStore: viewStore)
            DcView()
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}
