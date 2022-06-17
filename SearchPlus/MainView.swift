//
//  MainView.swift
//  SearchPlus
//
//  Created by Brian Dashore on 3/17/22.
//

import SwiftUI

enum Tab {
    case home
    case about
}

struct MainView: View {
    @AppStorage("extensionDisabled") var extensionDisabled: Bool = false
    @AppStorage("queryEngine") var queryEngine: SearchEngine = .init()
    @AppStorage("systemEngine") var systemEngine: SearchEngine = .init()

    @State private var tabSelection: Tab = .home
    @State private var showOnboardingView = false

    // Shows tabs on bottom of the screen
    var body: some View {
        TabView(selection: $tabSelection) {
            ContentView(extensionDisabled: $extensionDisabled, queryEngine: $queryEngine, systemEngine: $systemEngine)
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(Tab.home)
            AboutView()
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }
                .tag(Tab.about)
        }
        .accentColor(.orange)
        .onAppear {
            if !UserDefaults.grouped.bool(forKey: "appLaunchedOnce") {
                showOnboardingView.toggle()

                // Don't run this again
                UserDefaults.grouped.set(true, forKey: "appLaunchedOnce")
            }
        }
        .fullScreenCover(isPresented: $showOnboardingView) {
            OBPagerView(queryEngine: $queryEngine, systemEngine: $systemEngine, showOnboardingView: $showOnboardingView)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
