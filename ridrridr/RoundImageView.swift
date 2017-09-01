//
//  RoundImageView.swift
//  ridrridr
//
//  Created by Paul Defilippi on 8/28/17.
//  Copyright © 2017 Paul DeFilippi. All rights reserved.
//

import UIKit

class RoundImageView: UIImageView {
    
    override func awakeFromNib() {
        setupView()
    }

    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
}
