//
//  Animation.swift
//  GalaxyWars
//
//  Created by Emanuel  Guerrero on 1/28/16.
//  Copyright © 2016 Project Omicron. All rights reserved.
//

import Foundation
import UIKit

class Animation {
    private var _uiViewObject: UIView!
    
    private let options = UIViewAnimationOptions.Repeat
    private let duration = 1.0
    private let delay = 0.0
    
    init(uiViewObject: UIView!) {
        self._uiViewObject = uiViewObject
    }
    
    func startAnimation() {
        UIView.animateWithDuration(duration, delay: delay, options: options, animations: {
            self._uiViewObject.frame = CGRect(x: -900, y: 362, width: 1384, height: 238)
            
            }, completion: nil)
    }
}