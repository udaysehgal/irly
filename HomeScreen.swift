//
//  HomeScreen.swift
//  irly
//
//  Created by Uday on 15/05/24.
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        VStack {
            Spacer()
            
            WouldYouRatherView()
            
            Spacer()
            
            Image("sampleImage")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
        }
    }
}
