//
//  ViewController.swift
//  ridrridr
//
//  Created by Paul Defilippi on 8/21/17.
//  Copyright © 2017 Paul DeFilippi. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
    }




}

