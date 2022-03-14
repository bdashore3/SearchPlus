//
//  SafariWebExtensionHandler.swift
//  WebExtension
//
//  Created by Brian Dashore on 3/12/22.
//

import SafariServices
import os.log

class SafariWebExtensionHandler: NSObject, NSExtensionRequestHandling {

    func beginRequest(with context: NSExtensionContext) {
        let item = context.inputItems[0] as! NSExtensionItem
        let message = item.userInfo?[SFExtensionMessageKey]
        os_log(.default, "Received message from browser.runtime.sendNativeMessage: %@", message as! CVarArg)

        let response = NSExtensionItem()
        
        // Add UserDefaults support here
        response.userInfo = [
            SFExtensionMessageKey: [
                "queryUrl": "https://startpage.com/sp/search?q=%s"
            ]
        ]

        context.completeRequest(returningItems: [response], completionHandler: nil)
    }

}
