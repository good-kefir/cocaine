//
//  IDependenceStorage.swift
//  DependenceStorageSwift
//
//  Created by Ivankov Alexey on 06.05.16.
//  Copyright © 2016 Ivankov Alexey. All rights reserved.
//

import Foundation

protocol IInstanceStorage
{
    associatedtype T:Any;
    
    func add(object:T)
    func add(object:T, key:String)
    
    func object() -> T?
    func object(key:String) -> T?
    
    func remove(object:T)
    func remove(key:String)
    func removeAll()
}
