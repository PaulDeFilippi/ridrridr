//
//  CenterVCDelegate.swift
//  ridrridr
//
//  Created by Paul Defilippi on 9/3/17.
//  Copyright © 2017 Paul DeFilippi. All rights reserved.
//

import UIKit

protocol CenterVCDelegate {
    func toggleLeftPanel()
    func addLeftPanelViewController()
    func animateLeftPanel(shouldEpand: Bool)
}
