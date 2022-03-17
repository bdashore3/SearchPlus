//
//  SafariWebExtensionHandler.swift
//  WebExtension
//
//  Created by Brian Dashore on 3/12/22.
//

import os.log
import SafariServices

class SafariWebExtensionHandler: NSObject, NSExtensionRequestHandling {
    func beginRequest(with context: NSExtensionContext) {
        let item = context.inputItems[0] as! NSExtensionItem
        let message = item.userInfo?[SFExtensionMessageKey]
        os_log(.default, "Received message from browser.runtime.sendNativeMessage: %@", message as! CVarArg)

        let response = NSExtensionItem()

        // Default query and system URLs
        var queryEngine = SearchEngine(name: "StartPage", URL: "https://startpage.com/sp/search?q=%s")
        var systemEngine = SearchEngine(name: "Google", URL: "https://www.google.com/search")

        if let rawQueryEngine = UserDefaults.grouped.string(forKey: "queryEngine") {
            if let engine = SearchEngine(rawValue: rawQueryEngine) {
                queryEngine = engine
            }
        }

        if let rawSystemEngine = UserDefaults.grouped.string(forKey: "systemEngine") {
            if let engine = SearchEngine(rawValue: rawSystemEngine) {
                systemEngine = engine
            }
        }

        let disabled = UserDefaults.grouped.bool(forKey: "extensionDisabled")

        response.userInfo = [
            SFExtensionMessageKey: [
                "queryEngine": [
                    "name": queryEngine.name,
                    "url": queryEngine.URL
                ],
                "systemEngine": [
                    "name": systemEngine.name,
                    "url": systemEngine.URL
                ],
                "disabled": disabled
            ]
        ]

        context.completeRequest(returningItems: [response], completionHandler: nil)
    }
}
