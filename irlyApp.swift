//
//  irlyApp.swift
//  irly
//
//  Created by Uday on 12/05/24.
//

import SwiftUI

@main
struct irlyApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: irlyDocument()) { 
            WouldYouRather in
            ContentView()
        }
    }
}
