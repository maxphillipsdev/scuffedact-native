//
//  ScuffedRCTUIManager.swift
//  ios
//
//  Created by Max Phillips on 19/8/2023.
//
import UIKit
import Foundation
import JavaScriptCore
import yoga

@objc protocol ScuffedUIManagerExport: JSExport {
    func createTextInstance(_ text: String) -> Void
    func createInstance(_ type: String, _ props: [String: Any]) -> Void
}

@objc class ScuffedRCTUIManager: NSObject, ScuffedUIManagerExport {
    static func registerInto(jsContext: JSContext, forKeyedSubscript: String = "ScuffedUIManager") {
        jsContext.setObject(ScuffedRCTUIManager(),
                            forKeyedSubscript: forKeyedSubscript as (NSCopying & NSObjectProtocol))
    }
    
    func createTextInstance(_ text: String) {
        if ScuffedRCTBridge.rootViewController == nil {
            return
        }
        
        print("[NATIVE]: Creating ", text)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        label.center = ScuffedRCTBridge.rootViewController?.view.center ?? CGPoint(x:0, y:0)
        label.textAlignment = .center
        label.textColor = UIColor.black
        label.text = text
        
        ScuffedRCTBridge.rootViewController?.view.addSubview(label)
    }

    func createInstance(_ type: String, _ props: [String: Any]) {
        if ScuffedRCTBridge.rootViewController == nil {
            return
        }

        if type == "Text" {
            // We use createTextInstance to handle text
            return
        }
        
        print("[NATIVE]: Creating ", type, props)
        
        let view = UIView()
        
        let rootNode = YGNodeNew()
        

        ScuffedRCTBridge.rootViewController?.view.addSubview(view)
    }
}
