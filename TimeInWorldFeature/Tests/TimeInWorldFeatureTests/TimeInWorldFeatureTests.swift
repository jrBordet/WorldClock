import XCTest
import ComposableArchitecture
import TimeInWords
//import SnapshotTesting
@testable import TimeInWorldFeature

final class TimeInWorldFeatureTests: XCTestCase {
    let scheduler = DispatchQueue.test

    func testTimeInWords() throws {
        let store = TestStore(
            initialState: TimeInWorldState(date: .eightoClock),
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
        
        var dateComponent = DateComponents()
        dateComponent.second = 1
        
        store.send(.toggleTimerButtonTapped, {
            $0.isTimerActive = true
        })
        
        self.scheduler.advance(by: 1)
        
        store.receive(.timerTicked) {
            $0.secondsElapsed = 1
            
            $0.date = Calendar.current.date(byAdding: dateComponent, to: $0.date)!
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
