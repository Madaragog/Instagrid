//
//  ButtonsView.swift
//  Instagrid
//
//  Created by Cedric on 02/07/2019.
//  Copyright © 2019 Cedric. All rights reserved.
//

import Foundation
import UIKit


class ButtonsView: UIStackView {
    @IBOutlet weak var selectedLB: UIImageView!
    @IBOutlet weak var selectedMB: UIImageView!
    @IBOutlet weak var selectedRB: UIImageView!
    
//    Shows the selected mark in the tapped button, hides it for the others and send a notification to change the frame with the one assigned with the button
    @IBAction private func didTapLeftButton(_ sender: UIButton) {
        selectedLB.isHidden = false
        selectedMB.isHidden = true
        selectedRB.isHidden = true
        
        let nameLF = Notification.Name(rawValue: "leftFrameChange")
        let notificationLF = Notification(name: nameLF)
        NotificationCenter.default.post(notificationLF)
    }
    
    @IBAction private func didTapMiddleButton() {
        selectedLB.isHidden = true
        selectedMB.isHidden = false
        selectedRB.isHidden = true
        
        let nameMF = Notification.Name(rawValue: "middleFrameChange")
        let notificationMF = Notification(name: nameMF)
        NotificationCenter.default.post(notificationMF)
    }
    
    @IBAction private func didTapRightButton() {
        selectedLB.isHidden = true
        selectedMB.isHidden = true
        selectedRB.isHidden = false
        
        let nameRF = Notification.Name(rawValue: "rightFrameChange")
        let notificationRF = Notification(name: nameRF)
        NotificationCenter.default.post(notificationRF)
    }
}
