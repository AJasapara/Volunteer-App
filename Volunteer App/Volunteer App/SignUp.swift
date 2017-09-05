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
    @IBOutlet var email: UITextField!
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var dOB: UITextField!
    @IBOutlet var gender: UITextField!
    @IBOutlet var city: UITextField!
    @IBOutlet var state: UITextField!
    
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    @IBOutlet var signUpLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var fNLabel: UILabel!
    @IBOutlet var lNLabel: UILabel!
    @IBOutlet var dOBLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var stateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataOfUsers = module.retrieveData()
        spinner.hidesWhenStopped = true
    }
    
    @IBAction func enterData() {
        spinner.startAnimating()
        if isValid() {
            saveData(userData: userName.text!, passData: passWord.text!, emailIn: email.text!, firstNameIn: firstName.text!, lastNameIn: lastName.text!, dOBIn: dOB.text!, genderIn: gender.text!, cityIn: city.text!, stateIn: state.text!)
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "Log In")
            self.present(vc, animated: true, completion: nil)
        }
        spinner.stopAnimating()
    }
    
    func saveData(userData: String, passData: String, emailIn: String, firstNameIn: String, lastNameIn: String, dOBIn: String, genderIn: String, cityIn: String, stateIn: String) {
        module.push(values: [userData, passData, emailIn, firstNameIn, lastNameIn, dOBIn, genderIn, cityIn, stateIn], keys: ["username", "password", "email", "firstName", "lastName", "dOB", "gender", "city", "state"])
    }
    
    func isValid() -> Bool {
        var valid = true
        if !(email.text?.range(of: "@") != nil && (email.text?.range(of: ".com") != nil || email.text?.range(of: ".org") != nil)) {
            emailLabel.text = "Please enter proper email address!"
            valid = false
        }
        if firstName.text == nil {
            fNLabel.text = "Please enter a name!"
            valid = false
        }
        if lastName.text == nil {
            lNLabel.text = "Please enter a name!"
            valid = false
        }
        //For date of birth, need to have it check if age is valid (18+)
        if dOB.text == nil {
            dOBLabel.text = "Please enter a date of birth!"
            valid = false
        } else { dOBLabel.text = "" }
        if gender.text?.lowercased() == "male" || gender.text?.lowercased() == "female" {
            genderLabel.text = ""
            valid = true
        } else {
            genderLabel.text = "Please enter Male or Female"
            valid = false
        }
        if city.text == nil {
            cityLabel.text = "Please enter a City name!"
            valid = false
        } else { cityLabel.text = "" }
        if state.text == nil {
            stateLabel.text = "Please enter a State name!"
            valid = false
        } else { stateLabel.text = "" }
        if !(email.text?.range(of: "@") != nil && (email.text?.range(of: ".com") != nil || email.text?.range(of: ".org") != nil)) {
            emailLabel.text = "Please enter proper email address!"
            valid = false
        } else { emailLabel.text = "" }
        for users in dataOfUsers {
            let savedUser = users.value(forKey: "username") as! String
            
            if userName.text == savedUser {
                signUpLabel.text = "Username already exists!"
                valid = false
                break
            } else { signUpLabel.text = "" }
        }
        return valid
    }
}

// saveData(userData: userName.text!, passData: passWord.text!)
