//
//  WordClockApp.swift
//  WordClock
//
//  Created by Jean Raphael Bordet on 08/03/22.
//

import SwiftUI
import ComposableArchitecture
import TimeInWords
import TimeInWordsFeature

@main
struct WordClockApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            AppView(store: self.appDelegate.store)
        }
    }
}

extension AppEnvironment {
    static var live: Self {
        .init(
            mainQueue: DispatchQueue.main.eraseToAnyScheduler(),
            timeInWords: .live
        )
    }
}

let appReducer = Reducer<AppState, AppAction, AppEnvironment>.combine(
    appDelegateReducer
        .optional()
        .pullback(
            state: \AppState.appDelegate,
            action: /AppAction.appDelegate,
            environment: { _ in .init() }
        ),
    timeInWordsReducer
        .pullback(
            state: \AppState.timeInWords,
            action: /AppAction.timeInWords,
            environment: { $0.timeInWords }
        )
)

final class AppDelegate: NSObject, UIApplicationDelegate {
    let store = Store(
        initialState: AppState(timeInWords: TimeInWordsState(), appDelegate: .init()),
        reducer: appReducer,
        environment: .live
    )
    lazy var viewStore = ViewStore(
        self.store.scope(state: { _ in () }),
        removeDuplicates: ==
    )
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        
        self.viewStore.send(.appDelegate(.didFinishLaunching))
        
        self.viewStore.send(.timeInWords(.toggleTimerButtonTapped))
        
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        self.viewStore.send(.timeInWords(.startTimer))
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        self.viewStore.send(.timeInWords(.startTimer))
    }
}
