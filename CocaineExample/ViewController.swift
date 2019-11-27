//
//  ViewController.swift
//  CocaineExample
//
//  Created by Alexey Ivankov on 14.11.16.
//  Copyright © 2016 Alexey Ivankov. All rights reserved.
//

import UIKit
import Cocaine

class ViewController: UIViewController
{
    var service1:IServiceExample1 = Inject()
    var service2:IServiceExample2 = Inject()
    var service2Version2:IServiceExample2 = Inject(name: "version2")
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(service1)
        print(service2)
        print(service2Version2)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

