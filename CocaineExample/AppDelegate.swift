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

    var window: UIWindow?
    
    var testService1:IServiceExample1 = Inject()
    var testService2:IServiceExample2 = Inject()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        print(testService1)
        print(testService2)
        
        
        return true
    }
}

