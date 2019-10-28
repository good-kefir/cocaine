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
    associatedtype TypeObject:AnyObject;
    
    func add(object:TypeObject)
    func add(object:TypeObject, key:String)
    
    func object() -> TypeObject?
    func object(key:String) -> TypeObject?
    
    func remove(object:TypeObject)
    func remove(key:String)
    
    func all() -> [TypeObject]
}
