//
//  ExampleModule.swift
//  CocaineExample
//
//  Created by Alexey Ivankov on 27.11.2019.
//  Copyright © 2019 Alexey Ivankov. All rights reserved.
//

import Foundation
import Cocaine

class ExampleModule : IDependencyLoader{
    
    static func load(container: IContainer) {
        
    
        container.registerBuildLazy(type: IServiceExample1.self, name: nil, scope: .Singleton) { (container) -> (AnyObject) in
            return ServiceExample1()
        }
        
        container.registerBuildLazy(type: IServiceExample1.self, name: "version2", scope: .Singleton) { (container) -> (AnyObject) in
                   return ServiceExample1()
        }
        
        container.registerBuildLazy(type: IServiceExample2.self, name: nil, scope: .Singleton) { (container) -> (AnyObject) in
                   return ServiceExample2(param1: "1", param2: "2")
               }
        
        container.registerBuildLazy(type: IServiceExample2.self, name: "version2", scope: .Singleton) { (container) -> (AnyObject) in
            return ServiceExample2(param1: "3", param2: "4")
        }
        
        container.registerBuildLazy(type: IServiceExample3.self, name: nil, scope: .Singleton) { (container) -> (AnyObject) in
                   return ServiceExample3(param1: "1", param2: "2")
               }
        
        container.registerBuildLazy(type: IServiceExample4.self, name: nil, scope: .Singleton) { (container) -> (AnyObject) in
                   return ServiceExample4(param1: "1", param2: "2")
        }
    }
}
