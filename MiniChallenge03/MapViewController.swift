//
//  MapViewController.swift
//  MiniChallenge03
//
//  Created by Ricardo Sousa on 07/06/17.
//  Copyright © 2017 Julio Brazil LTDA. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: ViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    
    @IBOutlet var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
    }
    
    
    
    @IBAction func showUserLocation(_ sender: AnyObject) {
        map.showsUserLocation = !map.isUserLocationVisible
    }
    
    @IBAction func requestUserAuthorization(_ sender: AnyObject) {
        locationManager.requestWhenInUseAuthorization()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let position :CGPoint = touch.location(in: view)
            
            let ann = MKPointAnnotation()
            ann.coordinate = map.convert(position, toCoordinateFrom: self.view)
            ann.title = "My Pin"
            
            map.addAnnotation(ann)
        }
    }
    
    func addPin(title: String, subTitle: String, location: CLLocation){
        let position :CLLocation = location
        
        let ann = MKPointAnnotation()
        ann.coordinate = position.coordinate
        ann.title = "My Pin"
        
        map.addAnnotation(ann)
    }
}
