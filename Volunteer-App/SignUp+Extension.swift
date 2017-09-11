//
//  SignUp+Extension.swift
//  Volunteer-App
//
//  Created by Ed Basurto on 9/10/17.
//  Copyright © 2017 Ed Basurto. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import Firebase

extension SignUp {
    private func ref() -> DatabaseReference {
        return Database.database().reference()
    }
    
    private func authRef() -> Auth {
        return Auth.auth()
    }
    
    func createUser () {
        Auth.auth().createUser(withEmail: email.text!, password: password.text!) { (user, error) in
            let userid = user?.uid
            let errorMsg = error!.localizedDescription
            if(errorMsg == "") {
                let values = ["email": self.email.text!, "password": self.password.text!]
                self.saveUserInfo(values: values, uid: userid!)
                self.ref().child("User Profile").child(userid!).setValue([
                    "username": self.username.text!,
                    "name": self.firstName.text! + self.lastName.text!,
                    "dOB": self.dOB.text!,
                    "location": self.city.text! + self.state.text!])
            }
        }
    }
    
    func saveUserInfo (values: [String: String], uid: String) {
        ref().child("Users").child(uid).setValue(values) { (error, ref) in
            if(error != nil) {
                let ac = UIAlertController(title: "Error", message: error!.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                ac.addAction(cancel)
                self.present(ac, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func continueSignUp() {
        //let userID = Auth.auth().currentUser?.uid
        let str: String! = self.restorationIdentifier
        //var error = false
        switch str {
        case "Sign Up Page 1":
            let userEmail = email.text ?? ""
            ref().child("Users").queryEqual(toValue: userEmail)
                .observe(.value, with: { snapshot in
                    if (snapshot.hasChildren()) {
                        self.emailLabel.text = "Email is already in use"
                        //error = true
                    } else {
                        if(self.password.text! != self.confirmPassword.text!) {
                            self.passwordLabel.text = "Passwords do not match!"
                        } else {
                            let vc = self.storyboard!.instantiateViewController(withIdentifier: "Sign Up Part 2")
                            self.present(vc, animated: true, completion: nil)
                        }
                    }
                })
            
            break
        case "Sign Up Page 2":
            var error = false
            if(username.text! == "") {
                signUpLabel.text = "Please enter a display name"
                error = true
            } else if (firstName.text! == "") {
                fNLabel.text = "Please enter your first name"
                error = true
            } else if (lastName.text! == "") {
                lNLabel.text = "Please enter your last name"
                error = true
            }
            if(!error) {
                let vc = self.storyboard!.instantiateViewController(withIdentifier: "Sign Up Part 3")
                self.present(vc, animated: true, completion: nil)
            }
            break
        case "Sign Up Page 3":
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "Sign Up Part 4")
            self.present(vc, animated: true, completion: nil)
            break
        default:
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "Log In")
            self.present(vc, animated: true, completion: nil)
            break
        }
    }
}