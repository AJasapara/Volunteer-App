//
//  ViewController.swift
//  Volunteer App
//
//  Created by Ed Basurto on 9/2/17.
//  Copyright © 2017 Ed Basurto. All rights reserved.
//

import UIKit
import CoreData
import EasyCoreData

class ViewController: UIViewController {
    
    var module = CoreDataModule(entityName: "Entity", xcDataModelID: "Users")
    
    var usersData = [NSManagedObject]()
    
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    @IBOutlet var logLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        usersData = module.retrieveData()
        spinner.hidesWhenStopped = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func login() {
        spinner.startAnimating()
        for users in usersData {
            let savedUsername = users.value(forKey: "username") as! String
            let savedPassword = users.value(forKey: "password") as! String
            
            if usernameField.text == savedUsername && passwordField.text == savedPassword {
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
                let vc = self.storyboard!.instantiateViewController(withIdentifier: "Home")
                self.present(vc, animated: true, completion: nil)
            } else {
                logLabel.text = "Incorrect username and password combination!"
            }
        }
        spinner.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

