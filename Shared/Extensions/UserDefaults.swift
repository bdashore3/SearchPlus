//
//  UserDefaults.swift
//  SearchPlus
//
//  Created by Brian Dashore on 3/14/22.
//

import Foundation

extension UserDefaults {
    // If the grouped UserDefaults isn't available, the app should crash
    static let grouped = UserDefaults(suiteName: "group.me.kingbri.SearchPlus")!
}
