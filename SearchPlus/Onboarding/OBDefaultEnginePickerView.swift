//
//  OBDefaultEnginePicker.swift
//  SearchPlus
//
//  Created by Brian Dashore on 3/21/22.
//

import Introspect
import SwiftUI

struct OBDefaultEnginePickerView: View {
    @Binding var systemEngine: SearchEngine

    var body: some View {
        VStack(alignment: .leading) {
            Text("Select your current Safari search engine from the list below")
                .padding(.top)
                .padding(.horizontal, 25)

            PickerView(items: DefaultEngines, parentEngine: $systemEngine)
                .frame(maxHeight: 290)
                .introspectTableView { tableView in
                    tableView.isScrollEnabled = false
                    tableView.bounces = false
                }

            Text("You can find this by navigating to \nSettings > Safari > Search Engine")
                .padding(.horizontal, 25)

            Button("Take me there") {
                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
            }
            .padding(.top, 5)
            .padding(.horizontal, 25)
            .foregroundColor(.orange)

            Spacer()
        }
    }
}

struct OBDefaultEnginePickerView_Previews: PreviewProvider {
    static var previews: some View {
        OBDefaultEnginePickerView(systemEngine: .constant(.init()))
    }
}
