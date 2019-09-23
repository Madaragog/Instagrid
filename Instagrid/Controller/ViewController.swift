//
//  ViewController.swift
//  Instagrid
//
//  Created by Cedric on 29/08/2019.
//  Copyright © 2019 Cedric. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet var plus: [ImageButtonManager]!
    
    @IBOutlet weak var frameIMG: FrameChange!
    
    
    var selectedImage: ImageButtonManager!
    var picker = UIImagePickerController()
    
    
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
        let frameShare = Notification.Name(rawValue: "frameShar")
        NotificationCenter.default.addObserver(self, selector: #selector(frameShareFunc), name: frameShare, object: nil)
    }
    
    
    @IBAction func didTapButton(_ sender: ImageButtonManager) {
        selectedImage = sender
        picker.allowsEditing = false
        picker.delegate = self
        present(picker, animated: true)
    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let photo = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        dismiss(animated: true, completion: nil)
        
        selectedImage.setImage(UIImage(named: ""), for: .normal)
        selectedImage.setBackgroundImage(photo, for: .normal)
        selectedImage.imageView!.contentMode = .scaleAspectFit
    }
    
    @objc func frameShareFunc() {
        let image = frameIMG.createImage(frame: frameIMG)
        let activityViewController = UIActivityViewController(activityItems: [image as Any], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
        activityViewController.completionWithItemsHandler = {
            activity, completed, item, error in self.frameIMG.backInitialPlace()
        }
    }
    
   
    
}
