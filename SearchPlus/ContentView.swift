//
//  ContentView.swift
//  SearchPlus
//
//  Created by Brian Dashore on 3/12/22.
//

import SwiftUI

struct ContentView: View {
    // Shared extension variables
    @AppStorage("extensionDisabled") var extensionDisabled: Bool = false
    @AppStorage("queryEngine") var queryEngine: SearchEngine = .init(name: "", URL: "")
    @AppStorage("systemEngine") var systemEngine: SearchEngine = .init(name: "", URL: "")

    // App only variables
    @AppStorage("lastCustomUrl") var lastCustomUrl: String = ""

    @State var showPickerView = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Current query URL"),
                        footer: Text("To set a custom URL, select custom and input the search engine query URL in the textbox. \n\nScheme: https://domain.com/search?q=%s")) {
                    TextField("https://domain.com/search?q=%s", text: $queryEngine.URL, onCommit: {
                        if queryEngine.name == "Custom" {
                            lastCustomUrl = queryEngine.URL
                        }
                    })
                    .keyboardType(.URL)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                }
                .disabled(queryEngine.name != "Custom")

                Section(footer: Text("Set your default safari search engine to override.")) {
                    NavigationLink(isActive: $showPickerView) {
                        PickerView(items: DefaultEngines, parentEngine: $systemEngine)
                            .navigationTitle("Default Engines")
                            .navigationBarTitleDisplayMode(.inline)
                    } label: {
                        HStack {
                            Text("Safari default engine")
                            Spacer()
                            Text(systemEngine.name)
                                .foregroundColor(.gray)
                        }
                        .onTapGesture {
                            showPickerView.toggle()
                        }
                    }
                }

                Section(header: Text("Suggested search engines"),
                        footer: Text("Select a search engine to redirect to from the list or input a custom query URL.")) {
                    PickerView(items: SuggestedEngines, parentEngine: $queryEngine)
                        .onChange(of: queryEngine.name) { _ in
                            if queryEngine.name == "Custom" {
                                queryEngine.URL = lastCustomUrl
                            }
                        }
                }

                Section(footer: Text("Turning on this switch disables search redirection, effectively disabling the extension.")) {
                    Toggle(isOn: $extensionDisabled) {
                        Text("Disable everything")
                    }
                }
            }
            .navigationTitle("Search Engines")
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
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
