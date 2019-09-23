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
        
        swipeToShare()
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
    
    
    func swipeToShare() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(OrientationToShare(_:)))
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(OrientationToShare(_:)))
        
        swipeUp.direction = .up
        swipeLeft.direction = .left
        
        self.addGestureRecognizer(swipeUp)
        self.addGestureRecognizer(swipeLeft)
    }
    
    @objc func OrientationToShare(_ sender: UISwipeGestureRecognizer) {
        if UIDevice.current.orientation.isLandscape {
            sender.direction = .left
            swipeAnimation(translationX: -self.frame.width, y: 0)
        } else {
            sender.direction = .up
            swipeAnimation(translationX: 0, y: -self.frame.height)
        }
        let frameShare = Notification.Name(rawValue: "frameShar")
        let frameShareNotif = Notification(name: frameShare)
        NotificationCenter.default.post(frameShareNotif)
    }
    
    func swipeAnimation(translationX x: CGFloat, y: CGFloat) {
        UIView.animate(withDuration: 0.5, animations: {
            self.transform = CGAffineTransform(translationX: x, y: y)
        })
    }
    
    func createImage(frame: FrameChange) -> UIImage? {
        UIGraphicsBeginImageContext(self.frame.size)
        self.layer.render(in: UIGraphicsGetCurrentContext()!)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return UIImage() }
        return image
    }
    
    
    func backInitialPlace() {
        UIView.animate(withDuration: 0.5, animations: {
            self.transform = .identity
        }, completion: nil)
    }
    
}
