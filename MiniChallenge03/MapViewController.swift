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
    
    var hemocentros: [Hemocentro] = []
    
    @IBOutlet var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestWhenInUseAuthorization()
        map.showsUserLocation = true
        locationManager.delegate = self
        map.delegate = self
        
        //Zoom to user location
        if let noLocation = locationManager.location?.coordinate {
            let viewRegion = MKCoordinateRegionMakeWithDistance(noLocation, 5000, 5000)
            map.setRegion(viewRegion, animated: false)
        }
        DatabaseConnection.sharedInstance.getHemocentros(completion: { (hemocentros) in
            for hemo in hemocentros {
                self.addPin(hemocentro: hemo)
            }
        })
    }
    
    func addPin(hemocentro: Hemocentro){
        let position :CLLocation = CLLocation(latitude: CLLocationDegrees(hemocentro.latitude)!, longitude: CLLocationDegrees(hemocentro.longitude)!)
        
        let ann = HemoPin()
        
        ann.pinCustomImageName = "hemopin"
        ann.coordinate = position.coordinate
        ann.title = hemocentro.nome
        ann.subtitle = hemocentro.endereco
        
        let pinAnnotationView = MKAnnotationView(annotation: ann, reuseIdentifier: "pin")
        map.addAnnotation(pinAnnotationView.annotation!)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? HemoPin{
            
            let view = MKAnnotationView(annotation: annotation, reuseIdentifier: "pin")
            //TROCANDO IMAGEM DO PIN
            view.image = #imageLiteral(resourceName: "hemopin")
            view.isEnabled = true
            view.canShowCallout = true
            
            return view
        }
        
        return nil
    }
}
