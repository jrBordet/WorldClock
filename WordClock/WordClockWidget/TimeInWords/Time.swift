//
//  File.swift
//  
//
//  Created by Jean Raphael Bordet on 24/02/22.
//

import Foundation

struct Time {
	var hour: Int
	var minutes: Int
	
	var timeInWords: String {
		switch minutes {
		case 0:
			return "\(WordNumber(hour).word) o' clock"
		case 1:
			return "one minute past \(WordNumber(hour).word)"
		case 0..<15:
			return "\(WordNumber(minutes).word) past \(WordNumber(hour).word)"
		case 15:
			return "quarter past \(WordNumber(hour).word)"
		case 15..<30:
			return "\(WordNumber(minutes).word) minutes past \(WordNumber(hour).word)"
		case 30:
			return "half past \(WordNumber(hour).word)"
		case 30..<45:
			return "\(WordNumber(minutes).word) minutes to \(WordNumber(hour + 1).word)"
		case 45:
			return "quarter to \(WordNumber(hour + 1).word)"
		case 45..<60:
			return "\(WordNumber(minutes).word) minutes to \(WordNumber(hour + 1).word)"
		default:
			return ""
		}
	}
}

public func time12(_ hour: Int, minutes: Int) -> (hour: WordNumber, minutes: WordNumber, accessory: Accessory) {
    switch minutes {
    case 0:
        return (hour: WordNumber(hour).hour12, minutes: WordNumber(minutes), accessory: .o_clock)
    case 0..<5:
        return (hour: WordNumber(hour).hour12, minutes: .zero, accessory: .o_clock)
    case 5...9:
        return (hour: WordNumber(hour).hour12, minutes: .five, accessory: .past)
    case 10...14:
        return (hour: WordNumber(hour).hour12, minutes: .ten, accessory: .past)
    case 15...19:
        return (hour: WordNumber(hour).hour12, minutes: .fifteen, accessory: .quarter_past)
    case 20...24:
        return (hour: WordNumber(hour).hour12, minutes: .twenty, accessory: .past)
    case 25...29:
        return (hour: WordNumber(hour).hour12, minutes: .twenty_five, accessory: .past)
    case 30...34:
        return (hour: WordNumber(hour).hour12, minutes: .thirty, accessory: .half)
    case 35...39:
        return (hour: WordNumber(hour + 1).hour12, minutes: .twenty_five, accessory: .to)
    case 40...44:
        return (hour: WordNumber(hour + 1).hour12, minutes: .twenty, accessory: .to)
    case 45...49:
        return (hour: WordNumber(hour + 1).hour12, minutes: .fifteen, accessory: .quarter_to)
    case 50...54:
        return (hour: WordNumber(hour + 1).hour12, minutes: .ten, accessory: .to)
    case 51...59:
        return (hour: WordNumber(hour + 1).hour12, minutes: .five, accessory: .to)
    default:
        fatalError()
    }
}

public enum Accessory {
    case o_clock, past, to, at, quarter_past, half, quarter_to
    
    var word: String {
        switch self {
        case .o_clock:
            return "o'clock"
        case .past:
            return "past"
        case .to:
            return "to"
        case .at:
            return "at"
        case .quarter_past:
            return "quarter past"
        case .half:
            return "half past"
        case .quarter_to:
            return "quarter to"
        }
    }
    
}
