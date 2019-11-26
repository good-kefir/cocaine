//
//  Application.swift
//  CocaineExample
//
//  Created by Alexey Ivankov on 28.09.17.
//  Copyright © 2017 Alexey Ivankov. All rights reserved.
//

import Foundation
import UIKit
import Cocaine

class Application : UIApplication, IApplicationContext
{
    public let container:IContainer
    override init() {
        
        container = Cocaine.create()
        super.init()
    }
}
