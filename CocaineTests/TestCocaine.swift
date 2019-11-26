//
//  TestCocaine.swift
//  CocaineTests
//
//  Created by Alexey Ivankov on 26.11.2019.
//  Copyright © 2019 Alexey Ivankov. All rights reserved.
//

import XCTest
@testable import Cocaine

class TestCocaine: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRegister(){
        
        let container:IContainer = Cocaine.create()
        
        container.register(type: TestService1.self, scope: .Singleton) { (container) -> (AnyObject) in
            return TestService1(id: "1")
        }
        
        container.register(type: TestService2.self, scope: .Singleton) { (container) -> (AnyObject) in
            return TestService2(id: "1")
        }
        
        _ = container.receive(type: TestService1.self)
        _ = container.receive(type: TestService2.self)
        
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
