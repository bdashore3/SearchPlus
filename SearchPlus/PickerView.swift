//
//  PickerView.swift
//  SearchPlus
//
//  Created by Brian Dashore on 3/15/22.
//

import SwiftUI

struct PickerView: View {
    let items: [SearchEngine]

    @Binding var parentEngine: SearchEngine

    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                Button(action: {
                   parentEngine = item
                }, label: {
                    HStack {
                        Text(item.name)
                        Spacer()
                        if item.name == parentEngine.name {
                           Image(systemName: "checkmark")
                               .foregroundColor(.blue)
                        }
                    }
                })
            }
        }
        .accentColor(.primary)
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(items: DefaultEngines, parentEngine: .constant(SearchEngine(name: "", URL: "")))
    }
}
