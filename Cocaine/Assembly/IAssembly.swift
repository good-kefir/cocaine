//
//  I_Assembly.swift
//  Cocaine
//
//  Created by Alexey Ivankov on 25.09.17.
//  Copyright © 2017 Alexey Ivankov. All rights reserved.
//

import Foundation

public protocol IAssembly  : class  {

    var buildType:Any { get }
    var instanceScope:InstanceScope { get }
 
    func build(injector:IInjector) -> AnyObject
}
