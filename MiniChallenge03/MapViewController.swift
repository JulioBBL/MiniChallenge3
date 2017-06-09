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
import Firebase

class MapViewController: ViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    var hemocentros: [Hemocentro] = []
    
//    var ref = FIRDatabase.database().reference(withPath: "hemocentros")
    
    
    
    
    @IBOutlet var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        map.showsUserLocation = true
        locationManager.delegate = self
        
//        ref.child("hemocetros").observe(.childAdded, with: {snapshot in
//            self.hemocentros.append(Hemocentro(snapshot: snapshot))
//        })
    
        
    }

    
    func addPin(title: String, subTitle: String, location: CLLocation){
        let position :CLLocation = location
        
        let ann = MKPointAnnotation()
        ann.coordinate = position.coordinate
        ann.title = title
        ann.subtitle = subTitle
        
        map.addAnnotation(ann)
    }
    
    
    
}
