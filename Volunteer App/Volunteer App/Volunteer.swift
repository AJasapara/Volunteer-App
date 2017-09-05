//
//  Volunteer.swift
//  Volunteer App
//
//  Created by Ed Basurto on 9/2/17.
//  Copyright © 2017 Ed Basurto. All rights reserved.
//

import UIKit

class Volunteer: UIViewController {
    
    var myTempStr = "Hello World" //Can change value later on
    let myFixedStr = "Hello Galaxy" //Can't change value, stays constant
    
    var myStrArray = ["Hello", "World", "Hi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func funcName() {
        
    }
    
    func funcWithPars(myStr: String, myInt: Int) {
        print(myStr)
        print(myInt)
    }
    
    func funcWithReturn() -> Int {
        return 5
    }
}
