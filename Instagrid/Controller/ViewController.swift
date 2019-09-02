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
    
    
    
/*    @IBAction func plus1LFB(_ sender: UIButton) {
        let image = UIImagePickerController()
        image.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
        image.sourceType = UIImagePickerController.SourceType.photoLibrary
        
        image.allowsEditing = false
    }
*/
    
    
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
        
        
    }
    
    
}

