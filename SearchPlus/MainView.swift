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

    @State var tabSelection: Tab = .home

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
        .navigationViewStyle(.stack)
        .onAppear {
            // TODO: Add a simple onboarding screen to select the override and redirect search engines
            if !UserDefaults.grouped.bool(forKey: "appLaunchedOnce") {
                // Make sure grouped UserDefaults is tandem when the user installs the app
                queryEngine = SearchEngine(name: "Startpage", URL: "https://startpage.com/sp/search?q=%s")
                systemEngine = SearchEngine(name: "Google", URL: "https://www.google.com/search")
                extensionDisabled = false

                // Don't run this again
                UserDefaults.grouped.set(true, forKey: "appLaunchedOnce")
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
