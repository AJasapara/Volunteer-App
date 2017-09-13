//
//  EnableLocationController.swift
//  Cys List
//
//  Created by Cyril Garcia on 5/29/17.
//  Copyright © 2017 By Cyril. All rights reserved.
//

import UIKit
import CoreLocation

class EnableLocationController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
        
    }
    
    @IBAction func enableLocationServices() {
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() == true {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "Review")
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @IBAction func skipLocationServices() {
        let alertController = UIAlertController(title: "Enable later", message: "You can enable location services later under settings.", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Okay", style: .cancel) { (alert) in
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "Review")
            self.present(vc, animated: true, completion: nil)
        }
        alertController.addAction(cancel)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
