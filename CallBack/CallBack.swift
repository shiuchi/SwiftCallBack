//
//  Callback.swift
//  Callback
//
//  Created by 志内幸彦 on 2018/12/23.
//  Copyright © 2018 shiuchi. All rights reserved.
//


public final class Callback {
    
    /// Callableを作成して返却します
    ///
    /// - Parameters:
    ///   - handler: 実行したいclosure
    ///   - params: tuple(closure実行時に渡したい引数)
    /// - Returns: Callable
    public static func create<T, U> (_ handler: @escaping (T) -> U, params: T ) -> Callable {
        return CallBackInstance(handler:handler, params:params)
    }
    
    /// 引数なしのCallableを生成して返却します
    ///
    /// - Parameter handler: 実行したいclosure
    /// - Returns: Callable
    public static func create<T>(_ handler: @escaping () -> T ) -> Callable {
        return CallBackInstance(handler: handler, params:())
    }
    
    /// 弱参照Callableを作成して返却します /// ex: CallBack.create(h, handler: Hoge.fuga, params: "hogehoge")
    ///
    /// - Parameters:
    ///   - target:　closureを実行するインスタンス
    ///   - handler: closure
    ///   - params: tuple(closure実行時に渡したい引数)
    /// - Returns: Callable
    public static func create<T: AnyObject, U, V>(_ target: T, handler: @escaping (T) -> (U) -> V, params:U) -> Callable {
        return WeakCallBackInstance(target: target, handler: handler, params: params)
    }
    
    /// 引数なしの弱参照Callableを生成して返却します ex: CallBack.create(hoge, handler: Hoge.fuga)
    ///
    /// - Parameters:
    ///   - target: closureを実行するインスタンス
    ///   - handler: closure
    /// - Returns: Callable
    public static func create<T: AnyObject, V>(_ target: T, handler: @escaping (T) -> () -> V) -> Callable {
        return WeakCallBackInstance(target: target, handler: handler, params: ())
    }
}


/// callback object
fileprivate struct CallBackInstance<T, U>: Callable {
    
    fileprivate let callBack: Handler
    
    fileprivate init(handler:@escaping (T) -> U, params: T) {
        callBack = {
            let _ = handler(params)
        }
    }
    
    public func call() {
        callBack()
    }
}

/// weak callback
fileprivate struct WeakCallBackInstance<T:AnyObject, U, V>: Callable {
    
    fileprivate let callBack: Handler
    
    fileprivate init(target: T, handler: @escaping (T) -> (U) -> V, params:U) {
        callBack = { [weak target] in
            guard let target = target else { return }
            let _ = handler(target)(params)
        }
    }
    
    fileprivate init(target: T, handler: @escaping (T) -> () -> V, params: U) {
        callBack = { [weak target] in
            guard let target = target else { return }
            let _ = handler(target)
        }
    }
    
    func call() {
        callBack()
    }
}

/// callback protocol
public protocol Callable {
    typealias Handler = () -> Void
    func call()
}
