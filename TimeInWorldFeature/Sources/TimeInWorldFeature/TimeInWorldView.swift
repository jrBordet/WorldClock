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
        VStack(alignment: .center, spacing: 18) {
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
        .padding(16)
        .navigationBarTitle("Timers")
    }
}


//            HStack(alignment: .center, spacing: 16) {
//                Text("AC")
//                    .font(.custom("SpaceMono-Bold", size: 16))
//
//                if viewStore.accessory == .quarter_past {
//                    Text("QUARTER")
//                        .foregroundColor(Color.red)
//                        .font(.custom("SpaceMono-Bold", size: 16))
//                } else {
//                    Text("QUARTER")
//                        .font(.custom("SpaceMono-Bold", size: 16))
//                }
//
//                Text("DC")
//                    .font(.custom("SpaceMono-Bold", size: 16))
//            }
//
//            HStack(alignment: .center, spacing: 16) {
//                if viewStore.minutes == .twenty || viewStore.minutes == .twenty_five {
//                    Text("TWENTY")
//                        .foregroundColor(Color.red)
//                        .font(.custom("SpaceMono-Bold", size: 16))
//                } else {
//                    Text("TWENTY")
//                        .font(.custom("SpaceMono-Bold", size: 16))
//                }
//
//                if viewStore.minutes == .five || viewStore.minutes == .twenty_five {
//                    Text("FIVE")
//                        .foregroundColor(Color.red)
//                        .font(.custom("SpaceMono-Bold", size: 16))
//                } else {
//                    Text("FIVE")
//                        .font(.custom("SpaceMono-Bold", size: 16))
//                }
//
//                Text("X")
//                    .font(.custom("SpaceMono-Bold", size: 16))
//            }
//
//            HStack(alignment: .center, spacing: 16) {
//                if viewStore.accessory == .half {
//                    Text("HALF")
//                        .foregroundColor(Color.red)
//                        .font(.custom("SpaceMono-Bold", size: 16))
//                } else {
//                    Text("HALF")
//                        .font(.custom("SpaceMono-Bold", size: 16))
//                }
//
//                Text("B")
//                    .font(.custom("SpaceMono-Bold", size: 16))
//
//                if viewStore.minutes == .ten {
//                    Text("TEN")
//                        .foregroundColor(Color.red)
//                } else {
//                    Text("TEN")
//                }
//
//                Text("FTO")
//            }
//
//            HStack(alignment: .center, spacing: 16) {
//                if viewStore.accessory == .past || viewStore.accessory == .quarter_past {
//                    Text("PAST")
//                        .foregroundColor(Color.red)
//                } else {
//                    Text("PAST")
//                }
//
//                Text("ERU")
//
//                if viewStore.hour == .nine {
//                    Text("NINE")
//                        .foregroundColor(Color.red)
//                } else {
//                    Text("NINE")
//                }
//            }
//
//            HStack(alignment: .center, spacing: 16) {
//                if viewStore.hour == .one {
//                    Text("ONE")
//                        .foregroundColor(Color.red)
//                } else {
//                    Text("ONE")
//                }
//
//                if viewStore.hour == .six {
//                    Text("SIX")
//                        .foregroundColor(Color.red)
//                } else {
//                    Text("SIX")
//                }
//
//                if viewStore.hour == .three {
//                    Text("THREE")
//                        .foregroundColor(Color.red)
//                } else {
//                    Text("THREE")
//                }
//            }
//
//            HStack(alignment: .center, spacing: 16) {
//                if viewStore.hour == .four {
//                    Text("FOUR")
//                        .foregroundColor(Color.red)
//                } else {
//                    Text("FOUR")
//                }
//
//                if viewStore.hour == .five {
//                    Text("FIVE")
//                        .foregroundColor(Color.red)
//                } else {
//                    Text("FIVE")
//                }
//
//                if viewStore.hour == .two {
//                    Text("TWO")
//                        .foregroundColor(Color.red)
//                } else {
//                    Text("TWO")
//                }
//            }
//
//            HStack(alignment: .center, spacing: 16) {
//                if viewStore.hour == .eight {
//                    Text("EIGHT")
//                        .foregroundColor(Color.red)
//                } else {
//                    Text("EIGHT")
//                }
//
//                Text("E")
//
//                if viewStore.hour == .eleven {
//                    Text("ELEVEN")
//                        .foregroundColor(Color.red)
//                } else {
//                    Text("ELEVEN")
//                }
//            }
//
//            HStack(alignment: .center, spacing: 16) {
//                if viewStore.hour == .seven {
//                    Text("SEVEN")
//                        .foregroundColor(Color.red)
//                } else {
//                    Text("SEVEN")
//                }
//                if viewStore.hour == .twelve {
//                    Text("TWELVE")
//                        .foregroundColor(Color.red)
//                } else {
//                    Text("TWELVE")
//                }
//            }
//
//            HStack(alignment: .center, spacing: 16) {
//                if viewStore.hour == .ten {
//                    Text("TEN")
//                        .foregroundColor(Color.red)
//                } else {
//                    Text("TEN")
//                }
//                Text("E")
//                if viewStore.accessory == .o_clock {
//                    Text("OCLOCK")
//                        .foregroundColor(Color.red)
//                } else {
//                    Text("OCLOCK")
//                }
//            }

//Text(viewStore.timeInWords)

//            Button(action: { self.viewStore.send(.toggleTimerButtonTapped) }) {
//                HStack {
//                    Text(self.viewStore.isTimerActive ? "Stop" : "Start")
//                }
//                .foregroundColor(.white)
//                .padding()
//                .background(self.viewStore.isTimerActive ? Color.red : .blue)
//                .cornerRadius(16)
//            }
//
//            Spacer()

//            ZStack {
//                Circle()
//                    .fill(
//                        AngularGradient(
//                            gradient: Gradient(
//                                colors: [
//                                    Color.blue.opacity(0.3),
//                                    .blue,
//                                    .blue,
//                                    .green,
//                                    .green,
//                                    .yellow,
//                                    .yellow,
//                                    .red,
//                                    .red,
//                                    .purple,
//                                    .purple,
//                                    Color.purple.opacity(0.3),
//                                ]
//                            ),
//                            center: .center
//                        )
//                    )
//                    .rotationEffect(Angle(degrees: -90))
//
//                GeometryReader { proxy in
//                    Path { path in
//                        path.move(to: CGPoint(x: proxy.size.width / 2, y: proxy.size.height / 2))
//                        path.addLine(to: CGPoint(x: proxy.size.width / 2, y: 0))
//                    }
//                    .stroke(Color.black, lineWidth: 3)
//                    .rotationEffect(.degrees(Double(self.viewStore.secondsElapsed) * 360 / 60))
//                    .animation(Animation.interpolatingSpring(stiffness: 3000, damping: 40))
//                }
//            }
//            .frame(width: 280, height: 280)
//            .padding([.bottom], 16)
//
