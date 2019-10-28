//
//  CocaineTests.swift
//  CocaineTests
//
//  Created by Alexey Ivankov on 30.11.2017.
//  Copyright © 2017 Alexey Ivankov. All rights reserved.
//

import XCTest
import Cocaine
@testable import Cocaine


class CocaineTests: XCTestCase {
    
    var cocaine:ICocaine!
    
    override func setUp() {
        super.setUp()
        
         cocaine = Cocaine()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAdd(){
        
        self.cocaine.register.Register(assembly: Assembly(buildType: ITestService1.self, instanceScope: .Singleton) { (injector) -> AnyObject in
            return TestService1(id: "1")
        })
        
        self.cocaine.register.Register(assembly: Assembly(buildType: ITestService2.self, instanceScope: .Singleton) { (injector) -> AnyObject in
            
            return TestService2(id: "2")
        })
        
        let service1:ITestService1? = cocaine.injector.Inject()
        XCTAssert(service1 != nil)
        
        let service2:ITestService2? = cocaine.injector.Inject()
        XCTAssert(service2 != nil)
    }
    
    
    func testSingleton()
    {
        self.cocaine.register.Register(assembly: Assembly(buildType: ITestService1.self, instanceScope: .Singleton) { (injector) -> AnyObject in
            return TestService1(id: "1")
               })
               
               self.cocaine.register.Register(assembly: Assembly(buildType: ITestService2.self, instanceScope: .Singleton) { (injector) -> AnyObject in
                   
                return TestService2(id: "2")
               })
        
        let service1_v1:TestService1? = cocaine.injector.Inject(type: ITestService1.self) as? TestService1
        let service1_v2:TestService1? = cocaine.injector.Inject(type: ITestService1.self) as? TestService1
        
        XCTAssertEqual(service1_v1, service1_v2)
    }
    
    func testRemove(){
        
        self.cocaine.register.Register(assembly: Assembly(buildType: ITestService1.self, instanceScope: .Singleton) { (injector) -> AnyObject in
                   return TestService1(id: "1")
                      })
                      
        self.cocaine.register.Register(assembly: Assembly(buildType: ITestService2.self, instanceScope: .Singleton) { (injector) -> AnyObject in
                                
            return TestService2(id: "2")
                            })
        
        var service2:ITestService2? = cocaine.injector.Inject()
        XCTAssert(service2 != nil)
        
        self.cocaine.cleaner.CleanInstance(type: ITestService2.self)
        service2 = cocaine.injector.Inject()
        XCTAssert(service2 == nil)
    }
    
    func testModule(){
        
        let module:TestModule = TestModule()
        self.cocaine.register.Register(module: module)
        
        let service1:ITestService1? = cocaine.injector.Inject()
        XCTAssert(service1 != nil)
               
        let service2:ITestService2? = cocaine.injector.Inject()
        XCTAssert(service2 != nil)
        
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
