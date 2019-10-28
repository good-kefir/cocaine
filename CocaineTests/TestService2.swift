//
//  TestService2.swift
//  CocaineTests
//
//  Created by Alexey Ivankov on 30.11.2017.
//  Copyright © 2017 Alexey Ivankov. All rights reserved.
//

import Foundation

protocol ITestService2 : class {
    
}

class TestService2 : ITestService2, Equatable
{
    static func ==(lhs: TestService2, rhs: TestService2) -> Bool {
        return lhs == rhs
    }
}
