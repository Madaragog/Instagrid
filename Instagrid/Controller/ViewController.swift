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
    
//    changes the label depending on the device orientation
    private func labelChange() {
        if UIDevice.current.orientation.isPortrait {
            label.text = "Swipe up to share"
        } else {
            label.text = "Swipe left to share"
        }
    }
//    knows when the orientation changes
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        labelChange()
    }
//    initializes the view to take account of a notification sent
    override func viewDidLoad() {
        super.viewDidLoad()
        let frameShare = Notification.Name(rawValue: "frameShar")
        NotificationCenter.default.addObserver(self, selector: #selector(frameShareFunc), name: frameShare, object: nil)
    }
    
//    called when a button is tapped, assign the sender as selectedImage and manage the opening of the photo library
    @IBAction private func didTapButton(_ sender: ImageButtonManager) {
        selectedImage = sender
        picker.allowsEditing = false
        picker.delegate = self
        present(picker, animated: true)
    }

//    transforms the image picked into a UIImage and sets it into selectedImage and replaces the default view of the blue plus button that was pressed
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if info[UIImagePickerController.InfoKey.originalImage] != nil {
            let photo = info[UIImagePickerController.InfoKey.originalImage] as! UIImage

            dismiss(animated: true, completion: nil)
            
            selectedImage.setImage(UIImage(), for: .normal)
            selectedImage.setBackgroundImage(photo, for: .normal)
            selectedImage.imageView!.contentMode = .scaleAspectFit
        } else {
            self.frameIMG.backInitialPlace()
        }
    }
//    takes the image created by createImage(), allows you to share it and put the frame back to it's original place
    @objc private func frameShareFunc() {
        let image = frameIMG.createImage(frame: frameIMG)
        let activityViewController = UIActivityViewController(activityItems: [image as Any], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
        activityViewController.completionWithItemsHandler = {
            activity, completed, item, error in self.frameIMG.backInitialPlace()
        }
    }
}
