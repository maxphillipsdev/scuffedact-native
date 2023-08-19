//
//  ScuffedRCTUIManager.swift
//  ios
//
//  Created by Max Phillips on 19/8/2023.
//

import Foundation
import JavaScriptCore

@objc protocol ScuffedUIManagerExport: JSExport {
}

@objc class ScuffedRCTUIManager: NSObject, ScuffedUIManagerExport {
    static func registerInto(jsContext: JSContext, forKeyedSubscript: String = "ScuffedUIManager") {
        jsContext.setObject(ScuffedRCTUIManager(),
                            forKeyedSubscript: forKeyedSubscript as (NSCopying & NSObjectProtocol))
    }
    
    func createTextInstance() {
        
    }
}
