//
//  TestService1.swift
//  CocaineTests
//
//  Created by Alexey Ivankov on 30.11.2017.
//  Copyright © 2017 Alexey Ivankov. All rights reserved.
//

import Foundation

protocol ITestService1 : class  {
    
}

class TestService1 : ITestService1, Equatable
{
    let id:String
    
    required init(id:String){
        self.id = id
    }
    
    static func == (lhs: TestService1, rhs: TestService1) -> Bool {
        return lhs.id == rhs.id
    }
}
