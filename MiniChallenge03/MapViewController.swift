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

class MapViewController: ViewController, MKMapViewDelegate, CLLocationManagerDelegate, FIRDatabaseReferenceable {
    
    var hemocentros: [Hemocentro] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        map.showsUserLocation = true
        locationManager.delegate = self
        
        ref.child("hemocetros").observeEventType(.ChildAdded, withBlock: {
            self.posts.append(Hemocentro(snapshot: $0))
        })
    }
    
    
    
    @IBOutlet var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    func addPin(title: String, subTitle: String, location: CLLocation){
        let position :CLLocation = location
        
        let ann = MKPointAnnotation()
        ann.coordinate = position.coordinate
        ann.title = title
        ann.subtitle = subTitle
        
        map.addAnnotation(ann)
    }
    
    
    
}
