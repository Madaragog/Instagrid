//
//  FrameChange.swift
//  Instagrid
//
//  Created by Cedric on 19/07/2019.
//  Copyright © 2019 Cedric. All rights reserved.
//

import Foundation
import UIKit

class FrameChange: UIView {
    
    @IBOutlet weak var leftFrame: UIStackView!
    @IBOutlet weak var middleFrame: UIStackView!
    @IBOutlet weak var rightFrame: UIStackView!


    override func setNeedsDisplay() {
        super.setNeedsDisplay()
        let nameLF = Notification.Name(rawValue: "leftFrameChange")
        NotificationCenter.default.addObserver(self, selector: #selector(leftFrameIsSelected), name: nameLF, object: nil)
        
        let nameMF = Notification.Name(rawValue: "middleFrameChange")
        NotificationCenter.default.addObserver(self, selector: #selector(middleFrameIsSelected), name: nameMF, object: nil)
        
        let nameRF = Notification.Name(rawValue: "rightFrameChange")
        NotificationCenter.default.addObserver(self, selector: #selector(rightFrameIsSelected), name: nameRF, object: nil)
    }

    
    @objc func leftFrameIsSelected() {
        leftFrame.isHidden = false
        middleFrame.isHidden = true
        rightFrame.isHidden = true
    }
    
    @objc func middleFrameIsSelected() {
        leftFrame.isHidden = true
        middleFrame.isHidden = false
        rightFrame.isHidden = true
    }
    
    @objc func rightFrameIsSelected() {
        leftFrame.isHidden = true
        middleFrame.isHidden = true
        rightFrame.isHidden = false
    }
    
    
}
