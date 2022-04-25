//
//  LetterView.swift
//  WordClock
//
//  Created by Jean Raphael Bordet  on 25/04/22.
//

import Foundation
import SwiftUI

public struct LetterView: View {
    var letter: String
    var highighted: Bool
    
    public init(
        _ letter: String,
        highighted: Bool = false
    ) {
        self.letter = letter
        self.highighted = highighted
    }
    
    public var body: some View {
        if highighted {
        Text(letter)
            .font(.custom("SpaceMono-Bold", size: 26))
            .foregroundColor(Color.black)
            .frame(width: 26, height: 26, alignment: .center)
        } else {
            Text(letter)
                .font(.custom("SpaceMono-Bold", size: 26))
                .foregroundColor(Color.gray)
                .frame(width: 26, height: 26, alignment: .center)
        }
    }
}
