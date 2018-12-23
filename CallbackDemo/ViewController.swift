//
//  ViewController.swift
//  CallbackDemo
//
//  Created by 志内幸彦 on 2018/12/23.
//  Copyright © 2018 shiuchi. All rights reserved.
//

import UIKit
import Callback

class ViewController: UIViewController {

    private var c: Callable?
    private var wc: Callable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// create Callable
        c = Callback.create(trace, params: ("a"))
        
        /// create weak reference Callable
        wc = Callback.create(self, handler: ViewController.trace, params: ("b"))
        
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        c?.call()
        wc?.call()
    }
    
    
    
    func trace(str: String) {
        print(str)
    }


}

