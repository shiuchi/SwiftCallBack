//
//  Callback.swift
//  Callback
//
//  Created by shiuchi on 2018/12/23.
//  Copyright © 2018 shiuchi. All rights reserved.
//


/// Callable protocol
/// You can use this protocol if you want to define callback as a variable
public protocol Callable {
    typealias Handler = () -> Void
    func call()
}

private protocol CallbackProtocol: Callable {
    associatedtype Params
}


/// callback
public struct Callback<Params, Return>: CallbackProtocol {
    public typealias Params = Params
    
    let handler: Handler
    
    /// Callback
    ///
    /// - Parameters:
    ///   - handler: Method to be called example: self.someMethod
    ///   - params: arguments to pass to method, if you want to pass multiple values, Use a tuple
    public init(_ handler: @escaping (Params) -> Return, params: Params) {
        self.handler = {
            let _ = handler(params)
        }
    }
    
    public func call() {
        handler()
    }
}

public extension Callback where Callback.Params == Void {
    init(_ handler: @escaping () -> Return) {
        self.handler = {
            let _ = handler()
        }
    }
}

public struct WeakCallback<Target: AnyObject, Params, Return>: CallbackProtocol {
    public typealias Params = Params
    
    let handler: Handler
    
    /// WeakCallback
    ///
    /// - Parameters:
    ///   - target: Object to be called method
    ///   - handler: Method to be called example: WeakCallback(self, handler: ViewController.someMethod, params: ("value"))
    ///   - params: arguments to pass to method
    public init(_ target: Target, handler: @escaping (Target) -> (Params) -> Return, params: Params) {
        self.handler = { [weak target] in
            guard let target = target else { return }
            let _ = handler(target)(params)
        }
    }
    
    public func call() {
        handler()
    }
}

public extension WeakCallback where WeakCallback.Params == Void {
    init(_ target: Target, handler: @escaping (Target) -> () -> Return) {
        self.handler = { [weak target] in
            guard let target = target else {
                return
            }
            let _ = handler(target)()
        }
    }
}
