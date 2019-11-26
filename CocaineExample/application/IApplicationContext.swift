//
//  IApplicationContext.swift
//  CocaineExample
//
//  Created by Alexey Ivankov on 26.11.2019.
//  Copyright © 2019 Alexey Ivankov. All rights reserved.
//

import Foundation
import Cocaine

public protocol IApplicationContext{
    var container:IContainer { get }
}
