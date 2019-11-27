//
//  IContainer.swift
//  Cocaine
//
//  Created by Alexey Ivankov on 26.11.2019.
//  Copyright © 2019 Alexey Ivankov. All rights reserved.
//

import Foundation

public protocol IContainer {
    
    func registerBuildLazy(type:Any,
                           name:String?,
                           scope:InstanceScope,
                           main:@escaping (IContainer)->(AnyObject))
    
    func registerBuildNow(type:Any,
                          name:String?,
                          scope:InstanceScope,
                          main:@escaping (IContainer)->(AnyObject))
        
    func receive<T>(type:T.Type, name:String?) -> T
    
    func remove(type:AnyObject.Type, name:String?)
    func removeAll()
}
