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
    var highlighted: Bool
    
    public init(
        _ letter: String,
        highlighted: Bool = false
    ) {
        self.letter = letter
        self.highlighted = highlighted
    }
    
    public var body: some View {
        if highlighted {
            Text(letter)
                .font(.custom("SpaceMono-Bold", size: 26))
                .foregroundColor(Color("highlighted"))
                .frame(minWidth: 20, idealWidth: 30, idealHeight: 30, alignment: .center)
        } else {
            Text(letter)
                .font(.custom("SpaceMono-Bold", size: 26))
                .foregroundColor(Color.gray)
                .opacity(0.6)
                .frame(minWidth: 20, idealWidth: 30, idealHeight: 30, alignment: .center)
        }
    }
}

struct LetterView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            LetterView("A")
            LetterView("A", highlighted: true)
        }
    }
}
