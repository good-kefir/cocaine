//
//  Cocaine.swift
//  Cocaine
//
//  Created by Alexey Ivankov on 27.09.17.
//  Copyright © 2017 Alexey Ivankov. All rights reserved.
//

import Foundation

public class Cocaine : ICocaine, IRegister, IInjector, ICleaner
{
    lazy public var register:IRegister = self
    lazy public var injector:IInjector = self
    lazy public var cleaner:ICleaner = self
    
    internal var instances:InstanceStorage<AnyObject>
    internal var assemblys:InstanceStorage<AnyObject>
    
    required public init(){
        
        instances =  InstanceStorage<AnyObject>()
        assemblys = InstanceStorage<AnyObject>()
    }
    
    //MARK: - IRegister
    
    public func Register(assembly:IAssembly){
        let key = String (describing: assembly.buildType)
        self.assemblys.add(object: assembly, key:key)
    }
    
    public func Register(module: IAssemblyModule) {
        
        let assemblys = module.assemblys()
        
        for assembly in assemblys{
            Register(assembly: assembly)
        }
    }
    
    //MARK: IInjector
    
    public func Inject<T>() -> T? {
        
        let key = String (describing: T.self)
        return _Inject(key: key)
    }
    
    public func Inject<T:Any>(type:T) -> AnyObject?{
        let key = String(describing: type)
        return _Inject(key: key)
    }
    
    //MARK: ICleaner
    public func RemoveInstanceFromDI<T:Any>(type:T){
        let key = String(describing: type)
        self.instances.remove(key: key)
    }
    
    public func RemoveAssemblyFromDI<T:Any>(type:T){
        let key = String(describing: type)
        self.assemblys.remove(key: key)
    }
    
    public func RemoveAllInstancesFromDI(){
        let assemblysAll:[IAssembly] = assemblys.all() as! [IAssembly]
            
            for assembly:IAssembly in assemblysAll{
                
                let key = String (describing: assembly.buildType)
                self.instances.remove(key: key)
            }
    }
    
    private func _Inject<T>(key:String) -> T?{
        
        guard let assembly:IAssembly = self.assemblys.object(key: key) as? IAssembly else {
                  return nil
              }
              
              switch assembly.instanceScope{
                  
              case .New:
                  return assembly.build(injector:self) as? T
                  
              case .Singleton:
                  
                  if let instance = self.instances.object(key: key){
                      return instance as? T
                  }
                  else{
                      let instance = assembly.build(injector: self) as? T
                      self.instances.add(object: instance as AnyObject, key: key)
                      
                      return instance
                  }
                  
              @unknown default:
                  fatalError("instanceScope not supported")
              }
    }
}
