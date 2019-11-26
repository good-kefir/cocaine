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
    lazy var service1:IServiceExample1 = Inject()
    lazy var service2:ServiceExample2 = Inject()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(service1)
        print(service2)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

