//
//  ConsoleJS.swift
//  ios
//
//  Created by Max Phillips on 19/8/2023.
//

import Foundation
import JavaScriptCore

class ConsoleJS: NSObject {
    
    static func registerInto(jsContext: JSContext) {
            // implement console log with a native binding
            jsContext.evaluateScript("var console = { log: function(message) { _consoleLog(message) } }")
            let consoleLog: @convention(block) (String) -> Void = { message in
                print("[JAVASCRIPT LAND]: " + message)
            }
            jsContext.setObject(unsafeBitCast(consoleLog, to: AnyObject.self), forKeyedSubscript: "_consoleLog" as (NSCopying & NSObjectProtocol))
    }
}

