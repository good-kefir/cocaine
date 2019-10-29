//
//  ExampleModule.swift
//  CocaineExample
//
//  Created by Alexey Ivankov on 29.10.2019.
//  Copyright © 2019 Alexey Ivankov. All rights reserved.
//

import Foundation
import Cocaine

class ExampleModule : IAssemblyModule{
    
    func assemblys() -> [IAssembly] {
        return [
        
            Assembly(buildType: IServiceExample3.self, instanceScope: .Singleton) { (injector) -> AnyObject in
                return ServiceExample3(param1: "serviceExample3", param2: "serviceExample3")
            },
            
            Assembly(buildType: IServiceExample4.self, instanceScope: .Singleton) { (injector) -> AnyObject in
                return ServiceExample4(param1: "serviceExample4", param2: "serviceExample4")
            }
        ]
    }
}
