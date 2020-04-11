//
//  ViewController.swift
//  FoodTracker
//
//  Created by Rahmat Sulistio on 11/04/20.
//  Copyright © 2020 Rahmat Fam's. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: Properties
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealNameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mealNameTextField.delegate = self
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        photoImageView.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }

    // MARK: Action
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        mealNameTextField.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }

    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    
}

