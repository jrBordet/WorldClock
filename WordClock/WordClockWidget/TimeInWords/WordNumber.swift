//
//  File.swift
//  
//
//  Created by Jean Raphael Bordet on 24/02/22.
//

import Foundation

public enum WordNumber: Int {
	case zero = 0, one = 1, two = 2, three = 3, four = 4, five = 5, six = 6, seven = 7, eight = 8, nine = 9, ten = 10, eleven = 11, twelve = 12, thirteen = 13, fourteen = 14, fifteen = 15, sixteen = 16, seventeen = 17, eighteen = 18, nineteen = 19, twenty = 20, twenty_one = 21, twenty_two = 22, twenty_three = 23, twenty_four = 24, twenty_five = 25, twenty_six = 26, twenty_seven = 27, twenty_eight = 28, twenty_nine = 29, thirty = 30
	
	init(_ v: Int) {
		if v >= 0 && v <= 30 {
			self.init(rawValue: v)!
		} else {
			self.init(rawValue: 60 - v)!
		}
	}
}

extension WordNumber {
	var word: String {
		switch self {
        case .zero:
            return "zero"
		case .one:
			return "one"
		case .two:
			return "two"
		case .three:
			return "three"
		case .four:
			return "four"
		case .five:
			return "five"
		case .six:
			return "six"
		case .seven:
			return "seven"
		case .eight:
			return "eight"
		case .nine:
			return "nine"
		case .ten:
			return "ten"
		case .eleven:
			return "eleven"
		case .twelve:
			return "twelve"
		case .thirteen:
			return "thirteen"
		case .fourteen:
			return "fourteen"
		case .fifteen:
			return "fifteen"
		case .sixteen:
			return "sixteen"
		case .seventeen:
			return "seventeen"
		case .eighteen:
			return "eighteen"
		case .nineteen:
			return "nineteen"
		case .twenty:
			return "twenty"
		case .twenty_one:
			return "twenty one"
		case .twenty_two:
			return "twenty two"
		case .twenty_three:
			return "twenty three"
		case .twenty_four:
			return "twenty four"
		case .twenty_five:
			return "twenty five"
		case .twenty_six:
			return "twenty six"
		case .twenty_seven:
			return "twenty seven"
		case .twenty_eight:
			return "twenty eight"
		case .twenty_nine:
			return "twenty nine"
        case .thirty:
            return "thirty"
        }
	}
}
