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

class Application : UIApplication, IApplication
{
    private(set) var cocaine:ICocaine!
    
    override init() {
        
        super.init()
        self.cocaine = Cocaine()
        
        loadAssemblys()
        loadModules()
    }
        
    private func loadAssemblys()
    {
        self.cocaine.register.Register(assembly: Assembly(buildType: IServiceExample1.self, instanceScope: .Singleton) { (injector) -> AnyObject in
            return ServiceExample1()
        })
        
        self.cocaine.register.Register(assembly: Assembly(buildType: IServiceExample2.self, instanceScope: .Singleton) { (injector) -> AnyObject in
            
             return ServiceExample2(param1: "1", param2: "2")
        })
    }
    
    private func loadModules(){
        let module:ExampleModule = ExampleModule()
        self.cocaine.register.Register(module: module)
    }
}
