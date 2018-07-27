//
//  RoundedCornerTextField.swift
//  ridrridr
//
//  Created by Paul Defilippi on 10/23/17.
//  Copyright © 2017 Paul DeFilippi. All rights reserved.
//

import UIKit

class RoundedCornerTextField: UITextField {
    
    var textRectOffset: CGFloat = 20
    
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.height / 2
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.clear.cgColor
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 0 + textRectOffset, y: 0 + (textRectOffset / 2), width: self.frame.width - textRectOffset, height: self.frame.height + textRectOffset)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 0 + textRectOffset, y: 0 + (textRectOffset / 2), width: self.frame.width - textRectOffset, height: self.frame.height + textRectOffset)
    }

    

}
