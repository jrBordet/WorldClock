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

// TimeInWorldView
public struct ContentView: View {
    @ObservedObject var viewStore: ViewStore<TimeInWorldState, TimeInWordsAction>

    public init(store: Store<TimeInWorldState, TimeInWordsAction>) {
        self.viewStore = ViewStore(store)
    }

    public var body: some View {
        VStack {
            //Text(readMe)

            Text(viewStore.timeInWords)

            Button(action: { self.viewStore.send(.toggleTimerButtonTapped) }) {
                HStack {
                    Text(self.viewStore.isTimerActive ? "Stop" : "Start")
                }
                .foregroundColor(.white)
                .padding()
                .background(self.viewStore.isTimerActive ? Color.red : .blue)
                .cornerRadius(16)
            }

            Spacer()
        }
        .padding()
        .navigationBarTitle("Timers")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView(
                store: Store(
                    initialState: TimeInWorldState(),
                    reducer: timeInWordsReducer,
                    environment: TimeInWordsEnvironment(
                        mainQueue: DispatchQueue.main.eraseToAnyScheduler(),
                        timeInWords: { (h: Int, m: Int) -> Effect<String, Error> in
                            Effect(value: timeInWords(h: h, m: m))
                        },
                        time12InWords: { h, m in
                            fatalError()
                            //Effect(value: time12InWords(h: h, m: m))
                        }
                    )
                )
            )
        }
    }
}


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
