//
//  Utils+.swift
//  WordClock
//
//  Created by Jean Raphael Bordet on 08/03/22.
//

import Foundation

public func dateComponents(from date: Date) -> (hour: Int, minutes: Int)? {
	let result = Calendar.current.dateComponents([.hour, .minute], from: date)
	
	guard
		let hour = result.hour,
		let minutes = result.minute else {
			return nil
		}
	
	return (hour: hour, minutes: minutes)
}
