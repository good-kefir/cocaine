//
//  IContainer.swift
//  Cocaine
//
//  Created by Alexey Ivankov on 26.11.2019.
//  Copyright © 2019 Alexey Ivankov. All rights reserved.
//

import Foundation

public protocol IContainer {
    
    func register(type:Any,
                  scope:InstanceScope,
                  main:@escaping (IContainer)->(AnyObject))
        
    func receive<T>(type:T.Type) -> T
    
    func remove(type:AnyObject.Type)
    func removeAll()
}
