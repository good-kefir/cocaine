//
//  IApplicationContext.swift
//  CocaineExample
//
//  Created by Alexey Ivankov on 26.11.2019.
//  Copyright © 2019 Alexey Ivankov. All rights reserved.
//

import Foundation
import Cocaine

public protocol IApplicationContext{
    
    func Inject<T>(name:String?) -> T!
    func Register(type:Any,
                  scope: InstanceScope,
                  main: @escaping (IContainer) -> (AnyObject))
}
