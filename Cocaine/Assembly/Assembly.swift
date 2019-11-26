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

    public var buildType: Any
    public let instanceScope: InstanceScope
    public let container:IContainer
    
    let buildBlock: (IContainer)->AnyObject
    
    required public init(buildType: Any,
                         instanceScope: InstanceScope,
                         container:IContainer,
                         buildBlock:  @escaping (IContainer)->AnyObject)
    {
        self.buildType = buildType
        self.instanceScope = instanceScope
        self.container = container
        self.buildBlock = buildBlock
    }
    
    public func build() -> AnyObject {
        return self.buildBlock(self.container)
    }
}
