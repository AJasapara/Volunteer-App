//
//  HomePage.swift
//  Volunteer App
//
//  Created by Ed Basurto on 9/2/17.
//  Copyright © 2017 Ed Basurto. All rights reserved.
//

import UIKit

class HomePage: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signOut() {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "Log In")
        self.present(vc, animated: true, completion: nil)
    }
}
