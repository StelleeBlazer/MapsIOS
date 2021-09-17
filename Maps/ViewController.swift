//
//  ViewController.swift
//  Maps
//
//  Created by Mac n Cheese on 09/06/21.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        //tipe map
        map.mapType = .standard
        
        // latitude & longitude (titik koordinat)
        let coordinate = CLLocationCoordinate2D(latitude: -6.3248396, longitude: 106.6387697)
        
        //zoom in map
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
        //set ke map
        map.region = MKCoordinateRegion(center: coordinate, span: span)
        
        //marker
        let marker = MKPointAnnotation()
        marker.title = "stasiun Cisauk"
        marker.subtitle = "stasiun"
        marker.coordinate = coordinate
        
        map.addAnnotation(marker)
        
        // Do any additional setup after loading the view.
    }


}

