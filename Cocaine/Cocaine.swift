//
//  Cocaine.swift
//  Cocaine
//
//  Created by Alexey Ivankov on 27.09.17.
//  Copyright © 2017 Alexey Ivankov. All rights reserved.
//

import Foundation

public class Cocaine : ICocaine, IRegister, IInjector
{
    lazy public var register:IRegister = self
    lazy public var injector:IInjector = self
    
    internal var instances:InstanceStorage<AnyObject>
    internal var assemblyProviers:InstanceStorage<AnyObject>
    
    required public init(){
        
        instances =  InstanceStorage<AnyObject>()
        assemblyProviers = InstanceStorage<AnyObject>()
    }
    
    //MARK: - IRegister
    
    public func Register(assembly:IAssembly){
        let key = String (describing: assembly.buildType)
        self.assemblyProviers.add(object: assembly, key:key)
    }
    
    //MARK: IInjector
    
    public func Inject<T>() -> T? {
        
        let key = String (describing: T.self)
        
        guard let assembly:IAssembly = self.assemblyProviers.object(key: key) as? IAssembly else {
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
