//
//  DICore.swift
//  CocaineExample
//
//  Created by Alexey Ivankov on 28.09.17.
//  Copyright © 2017 Alexey Ivankov. All rights reserved.
//

import Foundation
import UIKit

public func Inject<T>() -> T!{
    
    let application:IApplication = UIApplication.shared as! Application
    return application.cocaine.injector.Inject()
    
}

