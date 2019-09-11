//
//  FrameImgPicker.swift
//  Instagrid
//
//  Created by Cedric on 12/09/2019.
//  Copyright © 2019 Cedric. All rights reserved.
//


import UIKit

class FrameImgPicker: UIStackView, UIGestureRecognizerDelegate {
    
    @IBOutlet var plus: [UIImageView]!
    
    
    override func setNeedsDisplay() {
        super.setNeedsDisplay()
        let imgInterraction = Notification.Name(rawValue: "imgInterract")
        NotificationCenter.default.addObserver(self, selector: #selector(imgAddInteraction), name: imgInterraction, object: nil)
    }
    
    @objc func imgAddInteraction() {
            for img in plus {
                let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTaped(tapGestureRecognizer:)))
                tapGestureRecognizer.delegate = self
                img.addGestureRecognizer(tapGestureRecognizer)
                img.isUserInteractionEnabled = true
            }
        
    }
    
    @objc func imageTaped(tapGestureRecognizer: UITapGestureRecognizer) {
        print("fdf")
        
    }
    
    
}
