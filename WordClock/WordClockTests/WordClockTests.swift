//
//  WordClockTests.swift
//  WordClockTests
//
//  Created by Jean Raphael Bordet on 08/03/22.
//

import XCTest
import ComposableArchitecture
import TimeInWords
@testable import WordClock

class WordClockTests: XCTestCase {
	
	override func setUpWithError() throws {
		// Put setup code here. This method is called before the invocation of each test method in the class.
	}
	
	override func tearDownWithError() throws {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}
	
	func testExample() throws {
		class TimersTests: XCTestCase {
			let scheduler = DispatchQueue.test
			
			func testStart() {
				let store = TestStore(
					initialState: TimersState(
						now: Date(timeIntervalSince1970: 1646744400)
					),
					reducer: timersReducer,
					environment: TimersEnvironment(
						mainQueue: self.scheduler.eraseToAnyScheduler(),
						timeInWords: { h, m in
							let value = TimeInWords.timeInWords(
								h: h,
								m: m
							)
							
							return Effect(value: value)
						}
					)
				)
				
				store.assert(
					.send(.toggleTimerButtonTapped) {
						$0.isTimerActive = true
					},
					.do { self.scheduler.advance(by: 1) },
					.receive(.timerTicked) {
						$0.secondsElapsed = 1
					},
					.receive(.timeInWordsResponse(.success("fourteen o' clock")), { state in
						state.timeInwords = "fourteen o' clock"
					}),
					//			  .do { self.scheduler.advance(by: 5) },
					//			  .receive(.timerTicked) {
					//				$0.secondsElapsed = 2
					//			  },
					//			  .receive(.timerTicked) {
					//				$0.secondsElapsed = 3
					//			  },
					//			  .receive(.timerTicked) {
					//				$0.secondsElapsed = 4
					//			  },
					//			  .receive(.timerTicked) {
					//				$0.secondsElapsed = 5
					//			  },
					//			  .receive(.timerTicked) {
					//				$0.secondsElapsed = 6
					//			  },
						.send(.toggleTimerButtonTapped) {
							$0.isTimerActive = false
						}
				)
			}
		}
		
	}
	
}
