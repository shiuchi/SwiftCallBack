//
//  ViewController.swift
//  CallBack
//
//  Created by 志内 幸彦 on 2018/03/12.
//  Copyright © 2018年 shiuchi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let c = CallBack.create({
            print("a")
        })

        let h = Hoge()
        
        let c2 = CallBack.create(h, handler: Hoge.log, params: ("fuga"))
        
        c.call()
        c2.call()
    }
}


class Hoge{
    
    func log(hoge:String) {
        print(hoge)
    }
    
}


