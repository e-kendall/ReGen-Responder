//
//  ReGen_ResponderApp.swift
//  ReGen Responder
//
//  Created by Eamon Kendall on 1/8/2023.
//

import SwiftUI
import FirebaseCore
import Firebase

@main
struct ReGen_ResponderApp: App {

    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
