//
//  File.swift
//  
//
//  Created by Jean Raphael Bordet  on 25/04/22.
//

import Foundation
import SwiftUI
import ComposableArchitecture

public struct ItIsAsexlaView: View {
    public var body: some View {
        HStack() {
            ItIsView()
            AsexlaView()
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}

public struct ItIsView: View {
    public var body: some View {
        HStack() {
            LetterView("I", highighted: true)
            LetterView("T", highighted: true)
            LetterView("L")
            LetterView("I", highighted: true)
            LetterView("S", highighted: true)
        }
    }
}

public struct AsexlaView: View {
    public var body: some View {
        HStack() {
            LetterView("A")
            LetterView("S")
            LetterView("E")
            LetterView("X")
            LetterView("L")
            LetterView("A")
        }
    }
}
