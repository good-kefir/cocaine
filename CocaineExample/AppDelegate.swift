//
//  AppDelegate.swift
//  CocaineExample
//
//  Created by Alexey Ivankov on 14.11.16.
//  Copyright © 2016 Alexey Ivankov. All rights reserved.
//

import UIKit
import  Cocaine


class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?{
        didSet{
            self.loadInstances()
        }
    }
    
    lazy var testService1:IServiceExample1 = Inject()
    lazy var testService2:ServiceExample2 = Inject()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        print(testService1)
        print(testService2)
        
        
        return true
    }
    
    private func loadInstances()
      {
      
        Register(type: IServiceExample1.self, scope: .Singleton) { (container) -> (AnyObject) in
              return ServiceExample1()
          }
        
        Register(type: ServiceExample2.self, scope: .Singleton) { (container) -> (AnyObject) in
            return ServiceExample2(param1: "1", param2: "2")
        }
          
      }

}

