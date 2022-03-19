//
//  AboutView.swift
//  SearchPlus
//
//  Created by Brian Dashore on 3/17/22.
//

import SwiftUI

struct AboutView: View {
    @State private var showDisclaimer = false

    var body: some View {
        VStack {
            Text("About")
                .font(.largeTitle)
                .bold()
                .padding()

            Image("AppImage")
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(25)

            Text("SearchPlus is a free and open source Safari search extension developed by Brian Dashore under the Apache-2.0 license.")
                .padding()

            List {
                ListRowTextView(leftText: "Version", rightText: UIApplication.shared.appVersion)
                ListRowTextView(leftText: "Build Number", rightText: UIApplication.shared.appBuild)
                ListRowLinkView(text: "Website", link: "https://kingbri.dev")
                ListRowLinkView(text: "GitHub Repository", link: "https://github.com/bdashore3/SearchPlus")
                ListRowLinkView(text: "Discord Support", link: "https://discord.gg/pswt7by")
            }
            .listStyle(.insetGrouped)
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
