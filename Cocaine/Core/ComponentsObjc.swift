//
//  ComponentsObjc.swift
//  Cocaine
//
//  Created by Alexey Ivankov on 22.08.2018.
//  Copyright © 2018 Alexey Ivankov. All rights reserved.
//

import Foundation

open class AssemblyProviderImpl : NSObject, IAssemblyProvider {

    required public override init() {
        super.init()
    }
    
    open func assembly() -> IAssembly? {
        fatalError("ovveride this methos!")
    }
    
    open class func buildType() -> Any {
        fatalError("ovveride this methos!")
    }
}
