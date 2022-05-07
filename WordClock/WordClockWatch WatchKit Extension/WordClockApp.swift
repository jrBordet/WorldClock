//
//  WordClockApp.swift
//  WordClockWatch WatchKit Extension
//
//  Created by Jean Raphael Bordet  on 02/05/22.
//

import SwiftUI
import TimeInWordsFeature

@main
struct WordClockApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
