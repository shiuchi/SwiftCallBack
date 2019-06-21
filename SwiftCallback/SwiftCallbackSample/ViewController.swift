//
//  ViewController.swift
//  SwiftCallbackSample
//
//  Created by shiuchi on 2019/06/20.
//  Copyright © 2019 shiuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logButton: SampleButton!
    @IBOutlet weak var colorButton: SampleButton!
    @IBOutlet weak var color2Button: SampleButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logButton.setCallback(callback: Callback(log, params: "ontap"))
        colorButton.setCallback(callback: Callback(chengeColor, params: UIColor.blue))
        color2Button.setCallback(callback: Callback(chengeColor, params: UIColor.white))
    }

    func log(str: String) {
        print(str)
    }
    
    func chengeColor(color: UIColor) {
        view.backgroundColor = color
    }
    
}
