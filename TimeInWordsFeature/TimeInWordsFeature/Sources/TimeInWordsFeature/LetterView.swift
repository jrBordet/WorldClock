//
//  LetterView.swift
//  WordClock
//
//  Created by Jean Raphael Bordet  on 25/04/22.
//

import Foundation
import SwiftUI

public struct LetterView: View {
    @Environment(\.colorScheme) var colorScheme
    
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
                .font(.custom(.fontName, size: .fontSize))
                .foregroundColor(self.colorScheme == .light ? Color(hex: "#dd000000") : Color(hex: "#FFFFFF"))
                .frame(minWidth: .minWidth, idealWidth: .idealSize, idealHeight: .idealSize, alignment: .center)
        } else {
            Text(letter)
                .font(.custom(.fontName, size: .fontSize))
                .foregroundColor(Color.gray)
                .opacity(0.45)
                .frame(minWidth: .minWidth, idealWidth: .idealSize, idealHeight: .idealSize, alignment: .center)
        }
    }
}

// https://developer.apple.com/documentation/uikit/text_display_and_fonts/adding_a_custom_font_to_your_app

struct LetterView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            LetterView("REGULAR")
            LetterView("HIGHLIGHTED", highlighted: true)
        }
    }
}

extension Font.Weight {
    static var weight: Self {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return .bold
        case .pad:
            return .regular
        default:
            return .regular
        }
    }
}

extension String {
    static var fontName: String {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return "Roboto-Regular"
        case .pad:
            return "Roboto-Regular"
        default:
            return "Roboto-Bold"
        }
    }
}

extension CGFloat {
    static var fontSize: Self {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return 10
        case .pad:
            return 50
        default:
            return 26
        }
    }
    
    static var minWidth: Self {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return 16
        case .pad:
            return 50
        default:
            return 20
        }
    }
    
    static var idealSize: Self {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return 16
        case .pad:
            return 50
        default:
            return 20
        }
    }
}
