//
//  ViewController.swift
//  ios
//
//  Created by Max Phillips on 19/8/2023.
//

import JavaScriptCore
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // yeah this looks like a good enough place to start up everything lol
        var context: JSContext;
        do {
            // create javascript land
            context = JSContext()
            
            // implement console log with a native binding
            context.evaluateScript("var console = { log: function(message) { _consoleLog(message) } }")
            let consoleLog: @convention(block) (String) -> Void = { message in
                print("[JAVASCRIPT LAND]: " + message)
            }
            context.setObject(unsafeBitCast(consoleLog, to: AnyObject.self), forKeyedSubscript: "_consoleLog" as (NSCopying & NSObjectProtocol))
            
            // steal an implementation of JS timers
            TimerJS.registerInto(jsContext: context)
            
            // Load the JS bundle
            if let path = Bundle.main.path(forResource: "index", ofType: "bundle") {
                let res = context.evaluateScript(try String(contentsOfFile: path, encoding: .utf8))
                print(res?.context.exception)
            } else {
                print("Failed to load bundle")
            }
        } catch {
            print(error.localizedDescription)
        }
    }


}

