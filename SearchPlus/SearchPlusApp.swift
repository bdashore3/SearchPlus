//
//  SearchPlusApp.swift
//  SearchPlus
//
//  Created by Brian Dashore on 3/12/22.
//

import SwiftUI

@main
struct SearchPlusApp: App {
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .defaultAppStorage(UserDefaults.grouped)
    }
}
