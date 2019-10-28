//
//  ICocaine.swift
//  Cocaine
//
//  Created by Alexey Ivankov on 28.10.2019.
//  Copyright © 2019 Alexey Ivankov. All rights reserved.
//

import Foundation

public protocol ICocaine  {

    var register:IRegister { get }
    var injector:IInjector { get }
    var cleaner:ICleaner   { get }
}
