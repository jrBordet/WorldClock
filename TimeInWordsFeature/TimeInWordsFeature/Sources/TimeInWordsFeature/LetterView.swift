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
            return 26
        case .pad:
            return 50//64
        default:
            return 26
        }
    }
    
    static var minWidth: Self {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return 20
        case .pad:
            return 50
        default:
            return 20
        }
    }
    
    static var idealSize: Self {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return 30
        case .pad:
            return 50
        default:
            return 20
        }
    }
}


//extension Color {
//    public static let adaptiveWhite = Self {
//        $0.userInterfaceStyle == .dark ? .isowordsBlack : .white
//    }
//    public static let adaptiveBlack = Self {
//        $0.userInterfaceStyle == .dark ? .white : .isowordsBlack
//    }
//
//    public static let isowordsBlack = hex(0x121212)
//    public static let isowordsOrange = hex(0xEAA980)
//    public static let isowordsRed = hex(0xE1685C)
//    public static let isowordsYellow = hex(0xF3E7A2)
//
//    public static let dailyChallenge = isowordsYellow
//    public static let multiplayer = isowordsRed
//    public static let solo = isowordsOrange
//}
//
//extension UIColor {
//    public static let cubeFaceDefaultColor = UIColor.white
//    public static let cubeFaceUsedColor = UIColor.hex(0xcccccc)
//    public static let cubeFaceSelectableColor = UIColor.hex(0xf7ddcc)
//    public static let cubeFaceSelectedColor = UIColor(cgColor: Color.isowordsOrange.cgColor!)
//    public static let cubeFaceCriticalColor = UIColor.hex(0xEDA49D)
//    public static let cubeRemovedColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
//}
//
//public let letterColors = [
//    "A"..<"H": [UIColor.hex(0xF3E7A2), .hex(0xEDBB8A), .hex(0xE79474), .hex(0xE1685C)],
//    "H"..<"O": [UIColor.hex(0xF3E7A2), .hex(0xEDBB8A), .hex(0xE79474), .hex(0xE1685C)],
//    "O"..<"V": [UIColor.hex(0xF3E7A2), .hex(0xEDBB8A), .hex(0xE79474), .hex(0xE1685C)],
//    "V"..<"ZZZ": [UIColor.hex(0xF3E7A2), .hex(0xEDBB8A), .hex(0xE79474), .hex(0xE1685C)],
//]
//
//public func colors(for word: String) -> [Color] {
//    letterColors
//        .first(where: { range, _ in range.contains(word) })?
//        .value
//        .map(Color.init)
//    ?? []
//}
