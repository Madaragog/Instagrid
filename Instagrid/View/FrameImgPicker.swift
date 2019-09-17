//
//  FrameImgPicker.swift
//  Instagrid
//
//  Created by Cedric on 12/09/2019.
//  Copyright © 2019 Cedric. All rights reserved.
//


import UIKit

class FrameImgPicker: UIStackView, UIGestureRecognizerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var plus: [UIImageView]!
    
    var selectedImage: UIButton!
    var picker = UIImagePickerController()
    
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
        
        let imgAddInterraction = Notification.Name(rawValue: "imgAddInterract")
        NotificationCenter.default.addObserver(self, selector: #selector(imgAddInteractionFunc), name: imgAddInterraction, object: nil)
        
        
    }
    
    @objc func imgAddInteractionFunc() {
        for img in plus {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTappedFunc(tapGestureRecognizer:)))
            tapGestureRecognizer.delegate = self
            img.addGestureRecognizer(tapGestureRecognizer)
            img.isUserInteractionEnabled = true
        }
    }
    
    @objc func imageTappedFunc(tapGestureRecognizer: UIButton) {
        selectedImage = tapGestureRecognizer
        picker.allowsEditing = true
        picker.delegate = self
        ViewController().present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let photo = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        
        ViewController().dismiss(animated: true, completion: nil)
        
        
        selectedImage.setImage(photo, for: .normal)
        selectedImage.imageView?.contentMode = .scaleToFill
        
    }
    
}
