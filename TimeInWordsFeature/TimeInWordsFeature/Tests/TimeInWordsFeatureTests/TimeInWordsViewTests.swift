//
//  TimeInWordsViewTests.swift
//  
//
//  Created by Jean Raphael Bordet  on 28/04/22.
//

import XCTest
import ComposableArchitecture
import TimeInWords
import SnapshotTesting
import SwiftUI
@testable import TimeInWordsFeature

class TimeInWordsViewTests: XCTestCase {
    let scheduler = DispatchQueue.test

    var viewController: UIViewController!
    var record = false
    var timeInWordsView: TimeInWordsView!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        timeInWordsView = TimeInWordsView(
            store: Store(
                initialState: .eightOClock,
                reducer: timeInWordsReducer,
                environment: .mock(
                    mainQueue: self.scheduler.eraseToAnyScheduler()
                )
            )
        )
        
        viewController = UIHostingController(rootView: timeInWordsView)
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        viewController = nil
        timeInWordsView = nil
    }
    
    func testEightOClock() {        
        assertSnapshot(
            matching: viewController,
            as: .image(on: .iPhoneX),
            record: record
        )
    }
    
    func testEightOClockViewOniPadPortrait() throws {
        assertSnapshot(
            matching: viewController,
            as: .image(on: .iPadPro11(.portrait)),
            record: record
        )
    }
    
    func testEightOClockViewOniPhoneDarkMode() throws {
        let traitDarkMode = UITraitCollection(userInterfaceStyle: UIUserInterfaceStyle.dark)
        
        assertSnapshot(
            matching: viewController,
            as: .image(on: .iPhoneX, traits: traitDarkMode),
            record: record
        )
    }

}