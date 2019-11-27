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

public func Inject<T>(name:String? = nil) -> T!{
    
    let applicationContext:IApplicationContext = UIApplication.shared as! Application
    return applicationContext.Inject(name: name)
}

public func Register(type:Any,
                     scope: InstanceScope,
                     main: @escaping (IContainer) -> (AnyObject)){
    
    let applicationContext:IApplicationContext = UIApplication.shared as! Application
    applicationContext.Register(type: type, scope: scope, main: main)
}

