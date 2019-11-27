//
//  Instance.swift
//  Cocaine
//
//  Created by Alexey Ivankov on 27.11.2019.
//  Copyright © 2019 Alexey Ivankov. All rights reserved.
//

import Foundation

class Instance {
    
    let name:String?
    let object:AnyObject
    
    required init(name:String?, object:AnyObject){
        self.name = name
        self.object = object
    }
}
