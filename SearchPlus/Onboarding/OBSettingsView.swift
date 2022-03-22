//
//  OBSettingsView.swift
//  SearchPlus
//
//  Created by Brian Dashore on 3/21/22.
//

import SwiftUI

struct OBSettingsView: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var imageTabViewSelection = 0

    var body: some View {
        VStack {
            Text("To get started, enable SearchPlus in \nSettings > Safari > Extensions.")
                .font(.body)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top)
                .padding(.horizontal, 25)

            Button("Take me there!") {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }
            .foregroundColor(.orange)
            .buttonStyle(.bordered)

            Text("What these options should look like")
                .padding(.top, 30)
                .font(.body)

            Spacer()

            TabView(selection: $imageTabViewSelection) {
                ForEach(0 ..< 3) { index in
                    VStack {
                        Image(colorScheme == .dark ? "OBSettings\(index + 1)-dark" : "OBSettings\(index + 1)-light")
                            .resizable()
                            .cornerRadius(20)
                            .scaledToFit()

                        Spacer()
                    }
                    .tag(index)
                }
            }
            .padding([.bottom, .horizontal])
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
        .font(.title2)
    }
}

struct OBSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        OBSettingsView()
    }
}
