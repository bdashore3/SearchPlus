//
//  SearchEngines.swift
//  SearchPlus
//
//  Created by Brian Dashore on 3/14/22.
//

import Foundation

struct SearchEngine: Codable, Hashable {
    var name: String = ""
    var URL: String = ""
}

// MARK: RawRepresentable conformance. Requires manual encoding/decoding to prevent crashes

extension SearchEngine: RawRepresentable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode(SearchEngine.self, from: data)
        else {
            return nil
        }
        self = result
    }

    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "{}"
        }
        return result
    }

    enum CodingKeys: String, CodingKey {
        case name
        case URL
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(URL, forKey: .URL)
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        URL = try container.decode(String.self, forKey: .URL)
    }
}

// Contains the search URLs without queries for matching against
let DefaultEngines: [SearchEngine] = [
    SearchEngine(name: "Google", URL: "https://www.google.com/search"),
    SearchEngine(name: "Yahoo", URL: "https://search.yahoo.com/search"),
    SearchEngine(name: "Bing", URL: "https://www.bing.com/search"),
    SearchEngine(name: "DuckDuckGo", URL: "https://duckduckgo.com/"),
    SearchEngine(name: "Ecosia", URL: "https://www.ecosia.org/search")
]

// Contains the search URLs with query placeholders
let SuggestedEngines: [SearchEngine] = [
    SearchEngine(name: "Brave", URL: "https://search.brave.com/search?q=%s"),
    SearchEngine(name: "Neeva", URL: "https://neeva.com/search?q=%s"),
    SearchEngine(name: "Presearch", URL: "https://engine.presearch.org/search?q=%s"),
    SearchEngine(name: "Qwant", URL: "https://www.qwant.com/?q=%s"),
    SearchEngine(name: "Startpage", URL: "https://startpage.com/sp/search?q=%s"),
    SearchEngine(name: "Custom", URL: "")
]
