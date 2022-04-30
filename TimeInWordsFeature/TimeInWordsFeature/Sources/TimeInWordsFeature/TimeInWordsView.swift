//
//  ContentView.swift
//  WordClock
//
//  Created by Jean Raphael Bordet on 08/03/22.
//

import SwiftUI
import ComposableArchitecture
import TimeInWords

public struct TimeInWordsView: View {
    struct ViewState: Equatable {
        public var show: Bool
        
        public init(state: TimeInWordsState) {
            self.show = state.hour != .zero
        }
    }
    
    let store: Store<TimeInWordsState, TimeInWordsAction>
    @ObservedObject var viewStore: ViewStore<ViewState, TimeInWordsAction>
    
    public init(
        store: Store<TimeInWordsState, TimeInWordsAction>
    ) {
        self.store = store
        self.viewStore = ViewStore(store.scope(state: ViewState.init))
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 16) {
            if viewStore.show {
                ItIsAsexlaView()
                
                AcQuarterDcView(store: store)
                
                TwentyFiveXView(store: store)

                HalfTenToView(store: store)

                PastNineView(store: store)

                OneSixThreeView(store: store)

                FourFiveTwoView(store: store)

                EightElevenView(store: store)

                SevenTwelveView(store: store)

                TenOClockView(store: store)
            }
        }.onAppear {
            viewStore.send(.toggleTimerButtonTapped)
        }
    }
}
