//
//  Container.swift
//  Cocaine
//
//  Created by Alexey Ivankov on 26.11.2019.
//  Copyright © 2019 Alexey Ivankov. All rights reserved.
//

import Foundation

class Container : IContainer {
 
    private var assemblys:InstanceStorage<Assembly>
    private var instances:InstanceStorage<AnyObject>
    
    required init(){
        self.assemblys = InstanceStorage<Assembly>()
        self.instances = InstanceStorage<AnyObject>()
    }
        
    func register(type:Any,
                  scope:InstanceScope,
                  main:@escaping (IContainer)->(AnyObject)){
        
        let assembly: Assembly = Assembly(buildType:type,
                                          instanceScope: scope,
                                          container: self,
                                          buildBlock: main)
        let key = String(describing:type)
        self.assemblys.add(object: assembly, key: key)
        
    }
    
    func receive<T>(type:T.Type) -> T{
        let key = String(describing:type)
        
        guard let assembly: Assembly = self.assemblys.object(key: key) else {
            fatalError("assembly not found")
        }
        
        switch assembly.instanceScope {
        
            case .New: do{
                return assembly.build() as! T
            }
                
            case .Singleton:do {
                
                let key = String(describing:type)
                var instance:AnyObject? = self.instances.object(key: key)
                
                if instance == nil{
                    instance = assembly.build()
                    self.instances.add(object: instance!)
                }
                
                return instance as! T
            }
        }
    }
    
    public func remove(type:AnyObject.Type){
        let key = String(describing:type)
        self.instances.remove(key: key)
        self.assemblys.remove(key: key)
    }
    
    public func removeAll(){
        self.instances.removeAll()
        self.assemblys.removeAll()
    }
}
