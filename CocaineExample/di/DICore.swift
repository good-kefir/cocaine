//
//  DICore.swift
//  CocaineExample
//
//  Created by Alexey Ivankov on 28.09.17.
//  Copyright © 2017 Alexey Ivankov. All rights reserved.
//

import Foundation
import UIKit
import Cocaine

public func Inject<T>() -> T!{
    
    let applicationContext:IApplicationContext = UIApplication.shared as! Application
    return applicationContext.container.receive(type: T.self)
}

public func Register(type:Any,
                     scope: InstanceScope,
                     main: @escaping (IContainer) -> (AnyObject)){
    
    let applicationContext:IApplicationContext = UIApplication.shared as! Application
    applicationContext.container.register(type: type, scope: scope, main: main)
}

