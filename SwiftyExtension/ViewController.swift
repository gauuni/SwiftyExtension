//
//  ViewController.swift
//  SwiftyExtension
//
//  Created by Nguyen on 3/22/17.
//  Copyright © 2017 Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let string = "12345"
        let substring1 = string.substringTo(index: 3)
        let subString2 = string.substringFrom(index: 2)
        
        print("substring1 " + substring1)
        print("substring2 " + subString2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

