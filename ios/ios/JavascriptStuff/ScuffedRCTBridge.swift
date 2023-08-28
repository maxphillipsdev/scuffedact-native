//
//  ScuffedRCTBridge.swift
//  ios
//
//  Created by Max Phillips on 19/8/2023.
//

import Foundation
import JavaScriptCore

class ScuffedRCTBridge {
    
    static var context: JSContext?;
    static var rootViewController: ViewController?;
    init(_ viewController: ViewController) {
        do {
            // create javascript land
            ScuffedRCTBridge.rootViewController = viewController
            ScuffedRCTBridge.context = JSContext()
            ScuffedRCTBridge.registerBridgingModules()
            
            // Load the JS bundle
            if let path = Bundle.main.path(forResource: "index", ofType: "bundle") {
                if ScuffedRCTBridge.context != nil {
                    let res = ScuffedRCTBridge.context?.evaluateScript(try String(contentsOfFile: path, encoding: .utf8))
                    if let jsError = res?.context.exception {
                        print("[JAVASCRIPT LAND]: ", jsError)
                    }
                }
            } else {
                print("Failed to load bundle")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    static func registerBridgingModules() -> Void {
        if let context = ScuffedRCTBridge.context {
            TimerJS.registerInto(jsContext: context)
            ConsoleJS.registerInto(jsContext: context)
            ScuffedRCTUIManager.registerInto(jsContext: context)
        }
    }
}
