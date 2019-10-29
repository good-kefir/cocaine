//
//  ServiceExample4.swift
//  CocaineExample
//
//  Created by Alexey Ivankov on 29.10.2019.
//  Copyright © 2019 Alexey Ivankov. All rights reserved.
//

import Foundation

public class ServiceExample4 : IServiceExample4
{
    public var param1:String
    public var param2:String

    required public init(param1:String, param2:String)
    {
        self.param1 = param1;
        self.param2 = param2;
    }
    
}
