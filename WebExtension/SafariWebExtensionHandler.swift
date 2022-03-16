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
        var queryUrl = "https://startpage.com/sp/search?q=%s"
        var systemUrl = "https://www.google.com/search"

        if let rawQueryEngine = UserDefaults.grouped.string(forKey: "queryEngine") {
            if let queryEngine = SearchEngine(rawValue: rawQueryEngine) {
                queryUrl = queryEngine.URL
            }
        }

        if let rawSystemEngine = UserDefaults.grouped.string(forKey: "systemEngine") {
            if let systemEngine = SearchEngine(rawValue: rawSystemEngine) {
                systemUrl = systemEngine.URL
            }
        }

        let disabled = UserDefaults.grouped.bool(forKey: "extensionDisabled")

        response.userInfo = [
            SFExtensionMessageKey: [
                "queryUrl": queryUrl,
                "systemUrl": systemUrl,
                "disabled": disabled
            ]
        ]

        context.completeRequest(returningItems: [response], completionHandler: nil)
    }
}
