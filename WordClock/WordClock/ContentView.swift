//
//  ContentView.swift
//  WordClock
//
//  Created by Jean Raphael Bordet on 08/03/22.
//

import SwiftUI
import TimeInWords

struct ContentView: View {
    var body: some View {
		Text(timeInWords(h: 10, m: 45))
			.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
