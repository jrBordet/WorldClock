import XCTest
import ComposableArchitecture
import TimeInWords
import SnapshotTesting
import SwiftUI
@testable import TimeInWordsFeature

final class TimeInWordsFeatureTests: XCTestCase {
    let scheduler = DispatchQueue.test
    
    func testTimeInWords() throws {
        let store = TestStore(
            initialState: TimeInWordsState(
                date: .eightoClock
            ),
            reducer: timeInWordsReducer,
            environment: .mock(
                mainQueue: self.scheduler.eraseToAnyScheduler(),
                timeInWords: { h, m in
                    Effect(value: timeInWords(h: h, m: m))
                },
                time12InWords: { h, m in
                    Effect(value: time12InWords(h: h, m: m))
                }
            )
        )
        
        store.send(.toggleTimerButtonTapped, {
            $0.isTimerActive = true
        })
        
        self.scheduler.advance(by: 1)
        
        var dateComponent = DateComponents()
        dateComponent.second = 1
        
        let date: Date = Calendar.current.date(byAdding: dateComponent, to: .eightoClock) ?? Date()
        
        store.receive(.timerTicked) {
            $0.secondsElapsed = 1
            $0.date = date
        }
        
        store.receive(.timeInWords)
        
        store.receive(.timeInWordsResponse(.success("eight o' clock")), {
            $0.timeInWords = "eight o' clock"
        })
        
        store.receive(.timw12InWordsResponse(.success(TimeIn12Components(hour: .eight, minutes: .zero, accessory: .o_clock))), {
            $0.hour = .eight
            $0.minutes = .zero
            $0.accessory = .o_clock
        })
        
        store.send(.toggleTimerButtonTapped) {
            $0.isTimerActive = false
        }
    }
}
