//
//  UIViewExt.swift
//  ridrridr
//
//  Created by Paul Defilippi on 9/12/17.
//  Copyright © 2017 Paul DeFilippi. All rights reserved.
//

import UIKit

extension UIView {
    func fadeTo(alphaValue: CGFloat, withDuration duration: TimeInterval) {
        UIView.animate(withDuration: duration) { 
            self.alpha = alphaValue
        }
        
    }
}
