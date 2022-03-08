//
//  ContentView.swift
//  WordClock
//
//  Created by Jean Raphael Bordet on 08/03/22.
//

import SwiftUI
import TimeInWords
import ComposableArchitecture

// MARK: - Timer feature domain

struct TimersState: Equatable {
  var isTimerActive = false
  var secondsElapsed = 0
}

enum TimersAction {
  case timerTicked
  case toggleTimerButtonTapped
}

struct TimersEnvironment {
  var mainQueue: AnySchedulerOf<DispatchQueue>
}

let timersReducer = Reducer<TimersState, TimersAction, TimersEnvironment> {
  state, action, environment in
  struct TimerId: Hashable {}

  switch action {
  case .timerTicked:
	state.secondsElapsed += 1
	return .none

  case .toggleTimerButtonTapped:
	state.isTimerActive.toggle()
	  
	return state.isTimerActive
	  ? Effect.timer(id: TimerId(), every: 1, tolerance: .zero, on: environment.mainQueue)
		.map { _ in TimersAction.timerTicked }
	  : Effect.cancel(id: TimerId())
  }
}
.signpost()
.debug()

private let readMe = """
  This application demonstrates how to work with timers in the Composable Architecture.

  Although the Combine framework comes with a `Timer.publisher` API, and it is possible to use \
  that API in the Composable Architecture, it is not easy to test. That is why we have provided an \
  `Effect.timer` API that works with schedulers and can be tested.
  """

struct ContentView: View {
	@ObservedObject var viewStore: ViewStore<TimersState, TimersAction>

	init(store: Store<TimersState, TimersAction>) {
	  self.viewStore = ViewStore(store)
	}

	var body: some View {
	  VStack {
		  Text(readMe)

		ZStack {
		  Circle()
			.fill(
			  AngularGradient(
				gradient: Gradient(
				  colors: [
					Color.blue.opacity(0.3),
					.blue,
					.blue,
					.green,
					.green,
					.yellow,
					.yellow,
					.red,
					.red,
					.purple,
					.purple,
					Color.purple.opacity(0.3),
				  ]
				),
				center: .center
			  )
			)
			.rotationEffect(Angle(degrees: -90))

		  GeometryReader { proxy in
			Path { path in
			  path.move(to: CGPoint(x: proxy.size.width / 2, y: proxy.size.height / 2))
			  path.addLine(to: CGPoint(x: proxy.size.width / 2, y: 0))
			}
			.stroke(Color.black, lineWidth: 3)
			.rotationEffect(.degrees(Double(self.viewStore.secondsElapsed) * 360 / 60))
			.animation(Animation.interpolatingSpring(stiffness: 3000, damping: 40))
		  }
		}
		.frame(width: 280, height: 280)
		.padding([.bottom], 16)

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
//    var body: some View {
//		Text(timeInWords(h: 10, m: 45))
//			.padding()
//    }
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
	  NavigationView {
		  ContentView(
		  store: Store(
			initialState: TimersState(),
			reducer: timersReducer,
			environment: TimersEnvironment(
			  mainQueue: DispatchQueue.main.eraseToAnyScheduler()
			)
		  )
		)
	  }
	}
//    static var previews: some View {
//        ContentView()
//    }
}
