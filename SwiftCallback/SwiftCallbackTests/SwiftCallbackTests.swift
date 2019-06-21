//
//  SwiftCallbackTests.swift
//  SwiftCallbackTests
//
//  Created by shiuchi on 2019/06/20.
//  Copyright © 2019 shiuchi. All rights reserved.
//

import XCTest
@testable import SwiftCallback

class SwiftCallbackTests: XCTestCase {

    private let value: String = "callback called"
    private let valueInt: Int = 1
    
    func testCallback() {
        
        let f = {
            XCTAssertTrue(true)
        }
        
        let c = Callback(f)
        c.call()
    }
    
    func testCallbackWithParams() {
        
        let f = { [value] str in
            XCTAssertEqual(str, value)
        }
        
        let c = Callback(f, params: value)
        c.call()
    }
    
    func testCallbackWithMultipleParams() {
        let f: (String, Int) -> Void = { [value, valueInt] str, int in
            XCTAssertEqual(str, value)
            XCTAssertEqual(int, valueInt)
        }
        
        let c = Callback(f, params: (value, valueInt))
        c.call()
    }
    
    func testWeakCallback() {
        let c = WeakCallback(self, handler: SwiftCallbackTests.call)
        c.call()
    }
    
    func testWeakCallbackWithParams() {
        let c = WeakCallback(self, handler: SwiftCallbackTests.call, params: value)
        c.call()
    }
    
    func call() {
        XCTAssertTrue(true)
    }

    func call(param: String) {
        XCTAssertEqual(param, value)
    }

}
