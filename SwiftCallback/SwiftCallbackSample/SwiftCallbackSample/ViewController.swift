//
//  ViewController.swift
//  SwiftCallbackSample
//
//  Created by shiuchi on 2019/06/20.
//  Copyright © 2019 shiuchi. All rights reserved.
//

import UIKit
import SwiftCallback

class ViewController: UIViewController {

    override func viewDidLoad() {
        @IBOutlet weak var testButton: SampleButton!
        super.viewDidLoad()
        @IBOutlet weak var button: SampleButton!
        @IBOutlet weak var button: SampleButton!
        // Do any additional setup after loading the view.
        let c = Caller.init(hoge)
    }
    
    func hoge() {
        print("hoge")
    }


}

