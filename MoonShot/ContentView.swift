//
//  ContentView.swift
//  MoonShot
//
//  Created by Hafizur Rahman on 27/11/25.
//

import SwiftUI

struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world! \(astronauts.count)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
