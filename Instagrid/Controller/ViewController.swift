//
//  ViewController.swift
//  Instagrid
//
//  Created by Cedric on 29/08/2019.
//  Copyright © 2019 Cedric. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    
    private func labelChange() {
        if UIDevice.current.orientation.isPortrait {
            label.text = "Swipe up to share"
        } else {
            label.text = "Swipe left to share"
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        labelChange()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imgInterraction = Notification.Name(rawValue: "imgInterract")
        let imgInterractionNotif = Notification(name: imgInterraction)
        NotificationCenter.default.post(imgInterractionNotif)
    }
    
    
    
    
}

