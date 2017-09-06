//
//  CreateEvent.swift
//  Volunteer App
//
//  Created by Arpit Jasapara on 9/6/17.
//  Copyright © 2017 Ed Basurto. All rights reserved.
//



import UIKit
import CoreData
import EasyCoreData

class CreateEvent:  UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var EventTitle: UITextField!
    @IBOutlet weak var Description: UITextField!
    @IBOutlet weak var NumVolunteers: UITextField!
    @IBOutlet weak var ZipCode: UITextField!
    @IBOutlet weak var Photo: UIImageView!
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        Photo.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pickPhoto(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = f
        present(imagePickerController, animated: true, completion: nil)
    }
    
}
