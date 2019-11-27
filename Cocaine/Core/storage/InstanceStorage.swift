//
//  DependenceStorage.swift
//  DependenceStorageSwift
//
//  Created by Ivankov Alexey on 10.05.16.
//  Copyright © 2016 Ivankov Alexey. All rights reserved.
//

import Foundation

class InstanceStorage<T:Any>: IInstanceStorage
{
    private var storage:[String:T]!
    fileprivate let lock:NSRecursiveLock
    
    typealias TypeObject = T
    
    required init()
    {
        lock = NSRecursiveLock();
        storage = [:]
    }
    
   
    //MARK: IInstanceStorage
    func add(object:T)
    {
        self.executeThreadSaveOperation {
            let key = String(describing: type(of: object))
            self.storage[key] = object
        }
    }
    
    func add(object:TypeObject, key:String){
        
        self.executeThreadSaveOperation {
            self.storage[key] = object
        }
    }
    
    func object() -> T? {
        
        var object:T? = nil;
        self.executeThreadSaveOperation {
            let key:String = String(describing:type(of: T?.self))
            object = self.storage[key]
        }
        
        return object;
    }
    
    func object(key:String) -> T? {
        
        var object:T? = nil;
        self.executeThreadSaveOperation {
            object = self.storage[key]
        }
        
        return object;
    }
    
    func remove(object:TypeObject)
    {
        self.executeThreadSaveOperation {
            let key:String = String(describing:type(of: object))
            self.storage[key] = nil
        }
    }
    
    func remove(key:String){
        
        self.executeThreadSaveOperation {
                   self.storage[key] = nil
               }
    }
    
    func removeAll(){
        self.executeThreadSaveOperation {
            self.storage.removeAll()
        }
    }
    

    func executeThreadSaveOperation(block:()->Void)
    {
        self.lock.lock();
            block();
        self.lock.unlock();
    }
}

