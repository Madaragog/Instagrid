//
//  ImageButtonManager.swift
//  Instagrid
//
//  Created by Cedric on 17/09/2019.
//  Copyright © 2019 Cedric. All rights reserved.
//

import Foundation
import UIKit

class ImageButtonManager: UIButton {
 
//    sets a default appearence for each button in every frame
    override public func setNeedsDisplay() {
        backgroundColor = #colorLiteral(red: 0.9418308139, green: 0.9425446987, blue: 0.9419413209, alpha: 1)
        setImage(UIImage(named: "Plus"), for: .normal)
    }
 
}
