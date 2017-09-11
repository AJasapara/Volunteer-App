//
//  SignUp.swift
//  Volunteer App
//
//  Created by Ed Basurto on 9/2/17.
//  Copyright © 2017 Ed Basurto. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class SignUp: UIViewController {
    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var confirmPassword: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var dOB: UITextField!
    @IBOutlet var gender: UITextField!
    @IBOutlet var city: UITextField!
    @IBOutlet var state: UITextField!
    
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    @IBOutlet var signUpLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var fNLabel: UILabel!
    @IBOutlet var lNLabel: UILabel!
    @IBOutlet var dOBLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var stateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.hidesWhenStopped = true
    }
    
    
    
    
    
    
}
