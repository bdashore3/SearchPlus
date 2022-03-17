//
//  ListRowViews.swift
//  SearchPlus
//
//  Created by Brian Dashore on 3/17/22.
//

import SwiftUI

struct ListRowLinkView: View {
    let text: String
    let link: String

    var body: some View {
        HStack {
            Link(text, destination: URL(string: link)!)
                .foregroundColor(.primary)

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
    }
}

struct ListRowTextView: View {
    let leftText: String
    var rightText: String?
    var rightSymbol: String?

    var body: some View {
        HStack {
            Text(leftText)

            Spacer()

            if let rightSymbol = rightSymbol {
                Image(systemName: rightSymbol)
                    .foregroundColor(.gray)
            } else if let rightText = rightText {
                Text(rightText)
            }
        }
    }
}
