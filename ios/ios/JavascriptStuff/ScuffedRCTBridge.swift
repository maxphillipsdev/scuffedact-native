//
//  ScuffedRCTBridge.swift
//  ios
//
//  Created by Max Phillips on 19/8/2023.
//

import Foundation
import JavaScriptCore

class ScuffedRCTBridge: NSObject {
    
    var context: JSContext;
    
    override init() {
        do {
            // create javascript land
            self.context = JSContext()
            
            ScuffedRCTBridge.registerBridgingModules(context: self.context)
            
            // Load the JS bundle
            if let path = Bundle.main.path(forResource: "index", ofType: "bundle") {
                let res = self.context.evaluateScript(try String(contentsOfFile: path, encoding: .utf8))
                if let jsError = res?.context.exception {
                    print("[JAVASCRIPT LAND]: ", jsError)
                }
            } else {
                print("Failed to load bundle")
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    static func registerBridgingModules(context: JSContext) -> Void {
        TimerJS.registerInto(jsContext: context)
        ConsoleJS.registerInto(jsContext: context)
        
        ScuffedRCTUIManager.registerInto(jsContext: context)
    }
}
