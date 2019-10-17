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

//    initializes the view to take account of a notification sent and when a swipe to share is performed by the user
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
// removes the observers
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: "leftFrameChange"), object: nil)
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: "middleFrameChange"), object: nil)
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: "rightFrameChange"), object: nil)
    }
//    displays the frame associated to the buttons and hides the others
    @objc private func leftFrameIsSelected() {
        leftFrame.isHidden = false
        middleFrame.isHidden = true
        rightFrame.isHidden = true
    }
    
    @objc private func middleFrameIsSelected() {
        leftFrame.isHidden = true
        middleFrame.isHidden = false
        rightFrame.isHidden = true
    }
    
    @objc private func rightFrameIsSelected() {
        leftFrame.isHidden = true
        middleFrame.isHidden = true
        rightFrame.isHidden = false
    }
    
//    creates the gestures
    private func swipeToShare() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(orientationToShare(_:)))
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(orientationToShare(_:)))
        
        swipeUp.direction = .up
        swipeLeft.direction = .left
        
        self.addGestureRecognizer(swipeUp)
        self.addGestureRecognizer(swipeLeft)
    }
//    detects the orientation and performs either a swipe left animation or a swipe up animation
    @objc private func orientationToShare(_ sender: UISwipeGestureRecognizer) {
        if UIDevice.current.orientation.isLandscape {
            swipeAnimation(translationX: -self.frame.width, y: 0)
        } else {
            swipeAnimation(translationX: 0, y: -self.frame.height)
        }
        let frameShare = Notification.Name(rawValue: "frameShar")
        let frameShareNotif = Notification(name: frameShare)
        NotificationCenter.default.post(frameShareNotif)
    }
//    used to create the swipe animations above
    private func swipeAnimation(translationX x: CGFloat, y: CGFloat) {
        UIView.animate(withDuration: 0.4, animations: {
            self.transform = CGAffineTransform(translationX: x, y: y)
        })
    }
//    create an image of the frame swipped
    public func createImage(frame: FrameChange) -> UIImage? {
        UIGraphicsBeginImageContext(self.frame.size)
        if  UIGraphicsGetCurrentContext() != nil {
            self.layer.render(in: UIGraphicsGetCurrentContext()!)
        } else {backInitialPlace()}
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
//    puts the swipped frame back to it's original place with an animation
    public func backInitialPlace() {
        UIView.animate(withDuration: 0.4, animations: {
            self.transform = .identity
        }, completion: nil)
    }
    
}
