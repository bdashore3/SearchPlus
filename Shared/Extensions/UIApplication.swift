//
//  UIApplication.swift
//  SearchPlus
//
//  Created by Brian Dashore on 3/17/22.
//

import SwiftUI

// Extensions to get the version/build number for AboutView
extension UIApplication {
    var appVersion: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "Unknown"
    }

    var appBuild: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "Unknown"
    }

    var buildType: String {
        #if DEBUG
        return "Debug"
        #else
        return "Release"
        #endif
    }
}
