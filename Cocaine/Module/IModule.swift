//
//  IModule.swift
//  Cocaine
//
//  Created by Alexey Ivankov on 29.10.2019.
//  Copyright © 2019 Alexey Ivankov. All rights reserved.
//

import Foundation

public protocol IModule{
    
    func assemblys() -> [IAssembly]
}
