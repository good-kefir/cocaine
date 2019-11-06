//
//  TestModule.swift
//  CocaineTests
//
//  Created by Alexey Ivankov on 29.10.2019.
//  Copyright © 2019 Alexey Ivankov. All rights reserved.
//

import Foundation
import Cocaine

class TestModule : IAssemblyModule{
    func assemblys() -> [IAssembly] {
        return [
        
            Assembly(buildType: ITestService1.self, instanceScope: .Singleton) { (injector) -> AnyObject in
                return TestService1(id: "1")
            },
            
            Assembly(buildType: ITestService2.self, instanceScope: .Singleton) { (injector) -> AnyObject in
                return TestService2(id: "2")
            }
        ]
    }
}
