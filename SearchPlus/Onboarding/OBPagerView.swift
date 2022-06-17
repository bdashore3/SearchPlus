//
//  PagerView.swift
//  SearchPlus
//
//  Created by Brian Dashore on 3/21/22.
//

import Introspect
import SwiftUI

struct OBPagerView: View {
    @Binding var queryEngine: SearchEngine
    @Binding var systemEngine: SearchEngine

    @Binding var showOnboardingView: Bool

    @State private var selection = 0

    var body: some View {
        VStack {
            NavView {
                TabView(selection: $selection) {
                    OBStartView()
                        .tag(0)
                        .navigationBarHidden(true)

                    Group {
                        OBSettingsView()
                            .tag(1)
                        OBDefaultEnginePickerView(systemEngine: $systemEngine)
                            .tag(2)
                        OBUserEnginePickerView(queryEngine: $queryEngine)
                            .tag(3)
                    }
                    .navigationTitle("Setup")

                    OBFinishedView(queryEngine: $queryEngine, systemEngine: $systemEngine)
                        .tag(4)
                        .navigationBarHidden(true)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
            }

            Button {
                switch selection {
                case 3:
                    if queryEngine.name.isEmpty || queryEngine.URL.isEmpty {
                        queryEngine = SearchEngine(name: "Startpage", URL: "https://startpage.com/sp/search?q=%s")
                    }

                    if systemEngine.name.isEmpty {
                        systemEngine = SearchEngine(name: "Google", URL: "https://www.google.com/search")
                    }
                case 4:
                    showOnboardingView = false
                    return
                default:
                    break
                }

                withAnimation {
                    selection += 1
                }
            } label: {
                VStack {
                    switch selection {
                    case 0:
                        Text("Start")
                            .font(.title2)
                    case 4:
                        Text("Finish")
                            .font(.title2)
                    default:
                        Text("Next")
                            .font(.title2)
                    }
                }
                .frame(maxWidth: 400)
            }
            .animation(.easeInOut, value: 5)
            .padding([.horizontal, .bottom])
            .tint(.orange)
            .font(.title)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 15))
            .controlSize(.large)
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct OBPagerView_Previews: PreviewProvider {
    static var previews: some View {
        OBPagerView(queryEngine: .constant(.init()), systemEngine: .constant(.init()), showOnboardingView: .constant(true))
    }
}
