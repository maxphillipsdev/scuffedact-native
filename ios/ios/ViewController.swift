//
//  ViewController.swift
//  ios
//
//  Created by Max Phillips on 19/8/2023.
//

import UIKit

class ViewController: UIViewController {

    static var rootViewController: ViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ViewController.rootViewController = self
        
        // Create a ScuffedRCTBridge
        ScuffedRCTBridge()
    }
}

