//
//  DependenceStorage.swift
//  DependenceStorageSwift
//
//  Created by Ivankov Alexey on 10.05.16.
//  Copyright © 2016 Ivankov Alexey. All rights reserved.
//

import Foundation

class InstanceStorage<T:AnyObject>: IInstanceStorage
{
    private var storage:NSMapTable<NSString, T>!
    fileprivate let lock:NSRecursiveLock
    
    typealias TypeObject = T
    
    required init()
    {
        lock = NSRecursiveLock();
        storage = NSMapTable(keyOptions: NSPointerFunctions.Options.copyIn, valueOptions: NSPointerFunctions.Options.strongMemory)
    }
    
   
    //MARK: IInstanceStorage
    func add(object:T)
    {
        self.executeThreadSaveOperation {
            let key = String(describing: type(of: object))
            self.storage.setObject(object, forKey: NSString(string:key));
        }
    }
    
    func add(object:TypeObject, key:String){
        
        self.executeThreadSaveOperation {
            self.storage.setObject(object, forKey: NSString(string:key));
        }
    }
    
    func object() -> T? {
        
        var object:T? = nil;
        self.executeThreadSaveOperation {
            let key:String = String(describing:type(of: T?.self))
            object = self.storage.object(forKey: NSString(string:key))
        }
        
        return object;
    }
    
    func object(key:String) -> T? {
        
        var object:T? = nil;
        self.executeThreadSaveOperation {
            object = self.storage.object(forKey: NSString(string:key))
        }
        
        return object;
    }
    
    func remove(object:TypeObject)
    {
        self.executeThreadSaveOperation {
            let key:String = String(describing:type(of: object))
            self.storage.removeObject(forKey:  NSString(string:key))
        }
    }
    
    func remove(key:String){
        
        self.executeThreadSaveOperation {
                   self.storage.removeObject(forKey:  NSString(string:key))
               }
    }
    
    func all() -> [T]
    {
        var all_objects:[T] = [];
        
        self.executeThreadSaveOperation
        {
            let object_enumerator = self.storage.objectEnumerator()
            
            while let object = object_enumerator?.nextObject()
            {
                if object is T {
                    all_objects.append(object as! T);
                }
            }
        }
        
        return all_objects;
    }
    
    func executeThreadSaveOperation(block:()->Void)
    {
        self.lock.lock();
            block();
        self.lock.unlock();
    }
}

