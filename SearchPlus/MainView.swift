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
    @State var tabSelection: Tab = .home

    // Shows tabs on bottom of the screen
    var body: some View {
        TabView(selection: $tabSelection) {
            ContentView()
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
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
