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
        
        //        if let location = map.userLocation.location {
        //            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 200 * 2.0, 200 * 2.0)
        //            map.setRegion(coordinateRegion, animated: true)
        //        }else{
        //            print("deu erro")
        //        }
        
        
        //Zoom to user location
        if let noLocation = locationManager.location?.coordinate {
        let viewRegion = MKCoordinateRegionMakeWithDistance(noLocation, 500, 500)
        map.setRegion(viewRegion, animated: false)
        }
        
        FirebaseConnection.getHemocentros {snapshot in
            for hemo in snapshot.children{
                self.addPin(hemocentro: Hemocentro(snapshot: hemo as! FIRDataSnapshot))
             
            }
        }
        
    }
    
    
    func addPin(hemocentro: Hemocentro){
        let position :CLLocation = CLLocation(latitude: CLLocationDegrees(hemocentro.latitude)!, longitude: CLLocationDegrees(hemocentro.longitude)!)
        let ann = MKPointAnnotation()
        ann.coordinate = position.coordinate
        ann.title = hemocentro.nome
        ann.subtitle = hemocentro.endereco
        
        map.addAnnotation(ann)
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 50 * 2.0, 50 * 2.0)
        map.setRegion(coordinateRegion, animated: false)
        
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        if let location = mapView.userLocation.location {
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 200 * 2.0, 200 * 2.0)
            map.setRegion(coordinateRegion, animated: true)
        }else{
            print("deu erro")
        }
    }
    
}
