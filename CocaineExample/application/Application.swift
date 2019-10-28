//
//  Application.swift
//  CocaineExample
//
//  Created by Alexey Ivankov on 28.09.17.
//  Copyright © 2017 Alexey Ivankov. All rights reserved.
//

import Foundation
import UIKit
import Cocaine

class Application : UIApplication, I_Application
{
    private(set) var cocaine:ICocaine!
    
    override init() {
        
        super.init()
        self.cocaine = Cocaine()
        loadAssemblys()
    }
        
    func loadAssemblys()
    {
        self.cocaine.register.Register(assembly: Assembly(buildType: ITestService1.self, instanceScope: .Singleton) { (injector) -> AnyObject in
            return TestService1()
        })
        
        self.cocaine.register.Register(assembly: Assembly(buildType: ITestService2.self, instanceScope: .Singleton) { (injector) -> AnyObject in
            
             return TestService2(param1: "1", param2: "2")
        })
        
    }
}
