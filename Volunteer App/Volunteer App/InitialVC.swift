//
//  InitialVC.swift
//  Volunteer App
//
//  Created by Ed Basurto on 9/2/17.
//  Copyright © 2017 Ed Basurto. All rights reserved.
//

import UIKit
import CoreData
import EasyCoreData

class InitialVC: UIViewController {
    var module = CoreDataModule(entityName: "Entity", xcDataModelID: "Users")
    var usersData = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkIfLoggedIn()    }
    
    func checkIfLoggedIn() {
        let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        
        if isLoggedIn {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "Home")
            self.present(vc, animated: true, completion: nil)
        } else {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "Log In")
            self.present(vc, animated: true, completion: nil)
        }
    }
}
