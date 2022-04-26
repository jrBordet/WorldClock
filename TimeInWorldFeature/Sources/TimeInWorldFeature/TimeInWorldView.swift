//
//  ContentView.swift
//  WordClock
//
//  Created by Jean Raphael Bordet on 08/03/22.
//

import SwiftUI
import ComposableArchitecture
import TimeInWords

private let readMe = """
  This application demonstrates how to work with timers in the Composable Architecture.
  
  Although the Combine framework comes with a `Timer.publisher` API, and it is possible to use \
  that API in the Composable Architecture, it is not easy to test. That is why we have provided an \
  `Effect.timer` API that works with schedulers and can be tested.
  """

// https://www.hackingwithswift.com/quick-start/swiftui/how-to-position-views-in-a-grid-using-lazyvgrid-and-lazyhgrid

public struct TimeInWorldView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>
    
    public init(store: Store<TimeInWorldState, TimeInWordsAction>) {
        self.viewStore = ViewStore(store)
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 16) {
            //Text(readMe)
            
//            Text(viewStore.timeInWords)
            
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
            viewStore.send(.toggleTimerButtonTapped)
        })
        .padding(4)
//        .navigationBarTitle("Timers")
    }
}
