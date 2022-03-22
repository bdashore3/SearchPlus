//
//  OBStartView.swift
//  SearchPlus
//
//  Created by Brian Dashore on 3/21/22.
//

import SwiftUI

struct OBStartView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Welcome to")
                Text("SearchPlus")
                    .foregroundColor(.orange)
            }
            .font(.largeTitle)
            .padding()

            Text("Tap the button to get started")
        }
    }
}

struct OBStartView_Previews: PreviewProvider {
    static var previews: some View {
        OBStartView()
    }
}
