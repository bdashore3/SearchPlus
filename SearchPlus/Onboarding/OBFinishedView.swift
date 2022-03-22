//
//  OBFinishedView.swift
//  SearchPlus
//
//  Created by Brian Dashore on 3/21/22.
//

import SwiftUI

struct OBFinishedView: View {
    @Binding var queryEngine: SearchEngine
    @Binding var systemEngine: SearchEngine

    var body: some View {
        VStack {
            Text("All Done!")
                .foregroundColor(.orange)
                .padding()
                .font(.largeTitle)

            Text("You are now overriding \(systemEngine.name) with \(queryEngine.name == "Custom" ? "a custom search engine" : queryEngine.name)")
                .padding()
        }
    }
}

struct OBFinishedView_Previews: PreviewProvider {
    static var previews: some View {
        OBFinishedView(queryEngine: .constant(.init()), systemEngine: .constant(.init()))
    }
}
