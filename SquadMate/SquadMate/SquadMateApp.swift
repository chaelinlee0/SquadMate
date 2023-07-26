//
//  SquadMateApp.swift
//  SquadMate
//
//  Created by Naol Basaye on 4/20/23.
//

import SwiftUI

@main
struct SquadMateApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView()
            LoginView()
                .environmentObject(DataStore())
        }
    }
}
