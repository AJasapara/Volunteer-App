//
//  SignUp.swift
//  Volunteer App
//
//  Created by Ed Basurto on 9/2/17.
//  Copyright © 2017 Ed Basurto. All rights reserved.
//

import UIKit
import CoreData
import EasyCoreData

class SignUp: UIViewController {
    var module = CoreDataModule(entityName: "Entity", xcDataModelID: "Users")
    var dataOfUsers = [NSManagedObject]()

    @IBOutlet var userName: UITextField!
    @IBOutlet var passWord: UITextField!
    
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    @IBOutlet var signUpLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataOfUsers = module.retrieveData()
        spinner.hidesWhenStopped = true
    }
    
    @IBAction func enterData() {
        spinner.startAnimating()
        var valid = true
        for users in dataOfUsers {
            let savedUser = users.value(forKey: "username") as! String
            
            if userName.text == savedUser {
                signUpLabel.text = "Username already exists!"
                valid = false
                break
            }
        }
        if valid {
            saveData(userData: userName.text!, passData: passWord.text!)
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "Log In")
            self.present(vc, animated: true, completion: nil)
        }
        spinner.stopAnimating()
    }
    
    func saveData(userData: String, passData: String) {
        module.push(values: [userData, passData], keys: ["username", "password"])
    }
}

// saveData(userData: userName.text!, passData: passWord.text!)
