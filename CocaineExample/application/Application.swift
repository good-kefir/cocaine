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

class Application : UIApplication, IApplicationContext
{
    public let container:IContainer
    override init() {
        
        container = Cocaine.create()
        super.init()
        ExampleModule.load(container: container)
    }
    
    public func Inject<T>(name:String?) -> T!{
        return self.container.receive(type: T.self, name: name)
    }

    public func Register(type:Any,
                         scope: InstanceScope,
                         main: @escaping (IContainer) -> (AnyObject)){
        self.container.registerBuildLazy(type: type, name: nil, scope: scope, main: main)
    }
}
