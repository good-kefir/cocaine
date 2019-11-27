//
//  Container.swift
//  Cocaine
//
//  Created by Alexey Ivankov on 26.11.2019.
//  Copyright © 2019 Alexey Ivankov. All rights reserved.
//

import Foundation

class Container : IContainer {
 
    private var assemblys:InstanceStorage<[IAssembly]>
    private var instances:InstanceStorage<[Instance]>
    
    required init(){
        self.assemblys = InstanceStorage<[IAssembly]>()
        self.instances = InstanceStorage<[Instance]>()
    }
        
    func registerBuildLazy(type:Any,
                           name:String?,
                           scope:InstanceScope,
                           main:@escaping (IContainer)->(AnyObject)){
        
        let assembly: Assembly = Assembly(buildType:type,
                                          name: name,
                                          instanceScope: scope,
                                          container: self,
                                          buildBlock: main)
        let key = String(describing:type)
        var collection:[IAssembly]? =  self.assemblys.object(key: key)
       
        if collection == nil{
            collection = [assembly]
        }
        else{
            collection!.append(assembly)
        }
        
        self.assemblys.add(object: collection!, key: key)
    }
    
    public func registerBuildNow(type:Any,
                                 name:String?,
                                 scope:InstanceScope,
                                 main:@escaping (IContainer)->(AnyObject)){
        
        let assembly: Assembly = Assembly(buildType:type,
                                          name: name,
                                          instanceScope: scope,
                                          container: self,
                                          buildBlock: main)
        let key = String(describing:type)
        var collectionAssemblys:[IAssembly]? =  self.assemblys.object(key: key)
        
        if collectionAssemblys == nil{
            collectionAssemblys = [assembly]
        }
        else{
            collectionAssemblys?.append(assembly)
        }
        self.assemblys.add(object: collectionAssemblys!, key: key)
        
        var collectionsInstances:[Instance]? = self.instances.object(key: key)
        let instance:Instance = Instance(name: name, object: assembly.build())
        
        if collectionsInstances == nil{
            collectionsInstances = [instance]
        }
        else{
            collectionsInstances?.append(instance)
        }
        self.instances.add(object: collectionsInstances!, key: key)
    }
        
    func receive<T>(type:T.Type, name:String?) -> T{
        
        guard name != nil else{
            return self.receive(type: type)
        }
        
        let key = String(describing:type)
        
        let assembly:IAssembly? = self.receiveAssembly(key: key, name: name!)
        
        if assembly == nil{
            fatalError("assembly not found")
        }
        
        var instance:Instance? = self.receiveInstance(key: key, name: name!)
        
        if instance != nil{
            return instance!.object as! T
        }
        else{
            switch assembly!.instanceScope {
                                                                                  
                case .New: do{
                    return assembly!.build() as! T
                }
                                                                                
                case .Singleton:do {
                    
                    var collectionInstances:[Instance] = []
                    instance = Instance(name: name, object: assembly!.build())
                    collectionInstances.append(instance!)
                    self.instances.add(object: collectionInstances, key: key)
                                   
                    return instance!.object as! T
                }
            }
        }
    }
    
    private func receive<T>(type:T.Type) -> T{
        let key = String(describing:type)
        
        let instance:Instance? = self.receiveInstance(key: key)
        
        if instance != nil{
            return instance!.object as! T
        }
        else{
            
            let assembly = self.receiveAssembly(key: key)
            
            if assembly == nil{
                fatalError("assembly not found")
            }
            
            switch assembly!.instanceScope {
                                   
                case .New: do{
                    return assembly!.build() as! T
                }
                                   
                case .Singleton:do {
                                   
                    var collectionInstances:[Instance] = []
                    let instance:Instance = Instance(name: nil, object: assembly!.build())
                    collectionInstances.append(instance)
                    self.instances.add(object: collectionInstances, key: key)
                                                                                                   
                    return instance.object as! T
                }
                                   
            }
        }
    }
    
    public func remove(type:AnyObject.Type, name:String? ){
        let key = String(describing:type)
        self.instances.remove(key: key)
        self.assemblys.remove(key: key)
    }
    
    public func removeAll(){
        self.instances.removeAll()
        self.assemblys.removeAll()
    }
    
    private func receiveInstance(key:String) -> Instance?{
        let collectionInstances:[Instance]? = self.instances.object(key: key)
        
        if collectionInstances == nil{
            return nil
        }
        
        for inctance in collectionInstances!{
            if inctance.name == nil{
                return inctance
            }
        }
        
        return nil
    }
    
    private func receiveInstance(key:String, name:String) -> Instance?{
        let collectionInstances:[Instance]? = self.instances.object(key: key)
        
        if collectionInstances == nil{
            return nil
        }
        
        for inctance in collectionInstances!{
            if inctance.name == name{
                return inctance
            }
        }
        
        return nil
    }
    
    private func receiveAssembly(key:String) -> IAssembly?{
        let collectionAssemblys:[IAssembly]? = self.assemblys.object(key: key)
        
        if collectionAssemblys == nil{
            return nil
        }
        
        for assembly in collectionAssemblys!{
            if assembly.name == nil{
                return assembly
            }
        }
        return nil
    }
    
    private func receiveAssembly(key:String, name:String) -> IAssembly?{
        let collectionAssemblys:[IAssembly]? = self.assemblys.object(key: key)
        
        if collectionAssemblys == nil{
            return nil
        }
        
        for assembly in collectionAssemblys!{
            if assembly.name == name{
                return assembly
            }
        }
        return nil
    }
    
    private func createCollectionAssemblysIfNeed(key:String){
        
        if self.assemblys.object(key: key) == nil{
            self.assemblys.add(object: [], key: key)
        }
    }
    
    private func createCollectionInstancesIfNeed(key:String){
        
          if self.instances.object(key: key) == nil{
              self.instances.add(object: [], key: key)
          }
    }
}
