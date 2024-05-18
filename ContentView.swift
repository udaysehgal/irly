//
//  ContentView.swift
//  irly
//
//  Created by Uday on 12/05/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome to irly!")
                    .font(.largeTitle)
                    .padding()

                NavigationLink(destination: HomeScreen()) {
                    Text("Let's begin!")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
