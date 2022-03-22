//
//  OBUserEnginePickerView.swift
//  SearchPlus
//
//  Created by Brian Dashore on 3/21/22.
//

import Introspect
import SwiftUI

struct OBUserEnginePickerView: View {
    @AppStorage("lastCustomUrl") var lastCustomUrl: String = ""

    @Binding var queryEngine: SearchEngine

    @State private var showCustomText = false
    @State private var tempCustomText = ""

    var body: some View {
        VStack(alignment: .leading) {
            Text("Select your preferred search engine from the list below")
                .padding(.top)
                .padding(.horizontal, 25)

            Form {
                Section(footer: Text("Selecting custom will allow you to enter a custom query URL.")) {
                    PickerView(items: SuggestedEngines, parentEngine: $queryEngine)
                        .onAppear {
                            if queryEngine.name == "Custom" {
                                showCustomText = true
                            }
                        }
                        .onChange(of: queryEngine.name) { name in
                            withAnimation {
                                if name == "Custom" {
                                    showCustomText = true
                                } else {
                                    showCustomText = false
                                }
                            }
                        }
                        .introspectTableView { tableView in
                            tableView.isScrollEnabled = false
                        }
                }

                Section(footer: showCustomText ? Text("Query scheme: https://domain.com/search?q=%s") : nil) {
                    if showCustomText {
                        TextField("https://domain.com/search?q=%s", text: $tempCustomText, onCommit: {
                            queryEngine.URL = tempCustomText
                            lastCustomUrl = tempCustomText
                        })
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .keyboardType(.URL)
                    }
                }
            }

            Spacer()
        }
    }
}

struct OBUserEnginePickerView_Previews: PreviewProvider {
    static var previews: some View {
        OBUserEnginePickerView(queryEngine: .constant(.init()))
            .previewInterfaceOrientation(.portrait)
    }
}
