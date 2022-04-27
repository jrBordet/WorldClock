//
//  ContentView.swift
//  WordClock
//
//  Created by Jean Raphael Bordet on 08/03/22.
//

import SwiftUI
import ComposableArchitecture
import TimeInWords

// https://www.hackingwithswift.com/quick-start/swiftui/how-to-position-views-in-a-grid-using-lazyvgrid-and-lazyhgrid

public struct TimeInWordsView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWordsState, TimeInWordsAction>
    
    public init(store: Store<TimeInWordsState, TimeInWordsAction>) {
        self.viewStore = ViewStore(store)
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 16) {
            ItIsAsexlaView()
            
            AcQuarterDcView(viewStore: viewStore)
            
            TwentyFiveXView(viewStore: viewStore)
            
            HalfTenToView(viewStore: viewStore)
            
            PastNineView(viewStore: viewStore)
            
            OneSixThreeView(viewStore: viewStore)
            
            FourFiveTwoView(viewStore: viewStore)
            
            EightElevenView(viewStore: viewStore)
            
            SevenTwelveView(viewStore: viewStore)
            
            TenOClockView(viewStore: viewStore)
        }
        .onAppear(perform: {
           // viewStore.send(.startTimer)
        })
        .padding(4)
    }
}
