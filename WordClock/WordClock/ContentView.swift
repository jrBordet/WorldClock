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
	var now = Date()
	var timeInwords: String = ""
}

enum TimersAction: Equatable {
	case timerTicked
	case toggleTimerButtonTapped
	
	case timeInWordsResponse(Result<String, TimeInWordsError>)
}

struct TimeInWordsError: Error, Equatable {}

struct TimersEnvironment {
	var mainQueue: AnySchedulerOf<DispatchQueue>
	
	var timeInWords: (Int, Int) -> Effect<String, TimeInWordsError>
}

extension TimersEnvironment {
	static var live: Self = .init(
		mainQueue: DispatchQueue.main.eraseToAnyScheduler(),
		timeInWords: { h, m in
			let value = TimeInWords.timeInWords(
				h: h,
				m: m
			)
			
			return Effect(value: value)
		}
	)
}

extension TimersEnvironment {
	static func mock(
		mainQueue: AnySchedulerOf<DispatchQueue> = DispatchQueue.main.eraseToAnyScheduler(),
		timeInWords: @escaping (Int, Int) -> Effect<String, TimeInWordsError> = { _,_ in fatalError() }
	) -> Self {
		.init(
			mainQueue: mainQueue,
			timeInWords: timeInWords
		)
	}
}

/**
 
 return Effect.merge(
 Effect<MapStationsAction, Never>(
 value: MapStationsAction.currentLocationButtonTapped
 ),
 Effect<MapStationsAction, Never>(
 value: MapStationsAction.load
 ),
 environment
 .locationManager
 .create(id: LocationManagerId())
 .map(MapStationsAction.locationManager)
 )
 
 .receive(on: environment.mainQueue)
 .catchToEffect()
 .map { .ricercaPosizioneResponse($0) }
 
 */

let timersReducer = Reducer<TimersState, TimersAction, TimersEnvironment> { state, action, environment in
	struct TimerId: Hashable {}
	
	switch action {
	case .timerTicked:
		state.secondsElapsed += 1
		
		let dateComponents = dateComponents(from: state.now)
				
		guard let dateComponents = dateComponents else {
			return .none
		}
		
		return environment
			.timeInWords(dateComponents.hour, dateComponents.minutes)
			.receive(on: environment.mainQueue)
			.catchToEffect()
			.map(TimersAction.timeInWordsResponse)
		
	case .toggleTimerButtonTapped:
		state.isTimerActive.toggle()
		
		return state.isTimerActive
		? Effect.timer(
			id: TimerId(),
			every: 1,
			tolerance: .zero,
			on: environment.mainQueue
		)
			.map { _ in TimersAction.timerTicked }
		: Effect.cancel(id: TimerId())
		
	case let .timeInWordsResponse(.success(response)):
		state.timeInwords = response
		return .none
		
	case let .timeInWordsResponse(.failure(e)):
		return .none
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
			
			Text(viewStore.timeInwords)
			
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
					environment: .mock()
				)
			)
		}
	}
	//    static var previews: some View {
	//        ContentView()
	//    }
}
