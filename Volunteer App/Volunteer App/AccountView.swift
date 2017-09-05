//
//  AccountView.swift
//  Volunteer App
//
//  Created by Ed Basurto on 9/5/17.
//  Copyright © 2017 Ed Basurto. All rights reserved.
//

import UIKit
import CoreData
import EasyCoreData

class AccountView: UIViewController {
    var module = CoreDataModule(entityName: "Entity", xcDataModelID: "Users")
    var dataOfUsers = [NSManagedObject]()
    
    
}
