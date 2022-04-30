//
//  File.swift
//  
//
//  Created by Jean Raphael Bordet  on 25/04/22.
//

import Foundation

extension WordNumber {
    public var shour12: String {
        switch self {
        case .zero:
            return "zero"
        case .one, .thirteen:
            return "one"
        case .two, .fourteen:
            return "two"
        case .three, .fifteen:
            return "three"
        case .four, .sixteen:
            return "four"
        case .five, .seventeen:
            return "five"
        case .six, .eighteen:
            return "six"
        case .seven, .nineteen:
            return "seven"
        case .eight, .twenty:
            return "eight"
        case .nine, .twenty_one:
            return "nine"
        case .ten, .twenty_two:
            return "ten"
        case .eleven, .twenty_three:
            return "eleven"
        case .twelve, .twenty_four:
            return "twelve"
        default:
            return ""
        }
    }
    
    public var hour12: WordNumber {
        switch self {
        case .zero:
            return .zero
        case .one, .thirteen:
            return .one
        case .two, .fourteen:
            return .two
        case .three, .fifteen:
            return .three
        case .four, .sixteen:
            return .four
        case .five, .seventeen:
            return .five
        case .six, .eighteen:
            return .six
        case .seven, .nineteen:
            return .seven
        case .eight, .twenty:
            return .eight
        case .nine, .twenty_one:
            return.nine
        case .ten, .twenty_two:
            return .ten
        case .eleven, .twenty_three:
            return .eleven
        case .twelve, .twenty_four:
            return .twelve
        default:
            return .zero
        }
    }
}
