//
//  IDependencyLoader.swift
//  Cocaine
//
//  Created by Alexey Ivankov on 27.11.2019.
//  Copyright © 2019 Alexey Ivankov. All rights reserved.
//

import Foundation

public protocol IDependencyLoader{
    static func load(container:IContainer)
}
