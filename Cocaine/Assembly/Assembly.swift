//
//  Assembly.swift
//  Cocaine
//
//  Created by Alexey Ivankov on 28.11.2017.
//  Copyright © 2017 Alexey Ivankov. All rights reserved.
//

import Foundation


public class Assembly : IAssembly
{
    public let buildType: Any
    public let instanceScope: InstanceScope
    
    let buildBlock: (_ injector:IInjector)->AnyObject
    
    required public init(buildType: Any,
                         instanceScope: InstanceScope,
                         buildBlock:  @escaping (_ injector:IInjector)->AnyObject)
    {
        self.buildType = buildType
        self.instanceScope = instanceScope
        self.buildBlock = buildBlock
    }
    
    public func build(injector:IInjector) -> AnyObject {
        return self.buildBlock(injector)
    }
}
