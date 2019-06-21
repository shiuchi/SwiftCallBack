//
//  SampleButton.swift
//  SwiftCallbackSample
//
//  Created by shiuchi on 2019/06/21.
//  Copyright © 2019 shiuchi. All rights reserved.
//

import Foundation
import UIKit

class SampleButton: UIButton {
    
    private var callback: Callable?
    
    func setCallback(callback: Callable) {
        self.callback = callback
    }
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        setup()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 4
        self.addTarget(self, action: #selector(SampleButton.onTap(_:)), for: UIControl.Event.touchUpInside)
    }
    
    @objc public func onTap(_ sender: UIEvent) {
        callback?.call()
    }
}
