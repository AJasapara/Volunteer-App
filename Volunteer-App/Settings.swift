//
//  Settings.swift
//  Cys List
//
//  Created by Cyril Garcia on 5/25/17.
//  Copyright © 2017 By Cyril. All rights reserved.
//

import UIKit


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}



class Settings {
    
    init() {
        
    }
    
    public class func getTimeStamp() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy '-' h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        
        let timestamp = formatter.string(from: Date())
        return timestamp
        
    }
    
    public class func shadowView(withView: UIView, radius: CGFloat) {
        withView.layer.shadowColor = UIColor.black.cgColor
        withView.layer.shadowOpacity = 1
        withView.layer.shadowOffset = CGSize.zero
        withView.layer.shadowRadius = radius
    }
    
    public class func alertController(withTitle: String, withMessage: String, cancel: String) -> UIAlertController {
        let alertController = UIAlertController(title: withTitle, message: withMessage, preferredStyle: .alert)
        let cancel = UIAlertAction(title: cancel, style: .cancel, handler: nil)
        alertController.addAction(cancel)
        return alertController
    }
    
    
}
