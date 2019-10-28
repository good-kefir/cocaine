//
//  IInjector.swift
//  Cocaine
//
//  Created by Alexey Ivankov on 28.10.2019.
//  Copyright © 2019 Alexey Ivankov. All rights reserved.
//

import Foundation

public protocol IInjector {
 
    func Inject<T>() -> T?
    func Inject<T:Any>(type:T) -> AnyObject?
}
