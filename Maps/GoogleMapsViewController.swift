//
//  GoogleMapsViewController.swift
//  Maps
//
//  Created by Mac n Cheese on 09/06/21.
//

import UIKit
import GoogleMaps

class GoogleMapsViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet weak var googleMaps: GMSMapView!
    
    var gps = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //atur konfigurasi GPS
        gps.delegate = self
        gps.startUpdatingLocation()
        gps.requestLocation()
        gps.requestWhenInUseAuthorization()
      
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        //ambil latitude & longitude
        let latitude = locations.last?.coordinate.latitude
        let longitude = locations.last?.coordinate.longitude
        
        //set ke map
        let camera = GMSCameraPosition.camera(withLatitude: latitude!, longitude: longitude!, zoom:13.0)
                googleMaps.animate(to: camera)
        
        //ambil data lokasi
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: latitude!, longitude: longitude!)
        
        geocoder.reverseGeocodeLocation(location) {(placemarks, Error) in
            
            //place details
            var placemark: CLPlacemark!
            placemark = placemarks![0]
            
            // adress dictionary
//            print("locality " + placemark.locality!)
//            print("administrative area " + placemark.administrativeArea!)
//            print("country " + placemark.country!)
//            print("sub locality " + placemark.subLocality!)
//            print("name " + placemark.name!)
//            print("postal code " + placemark.postalCode!)
            print("description " + placemark.description)
//            print("iso country code " + placemark.isoCountryCode!)
            
            
            
            // Creates a marker in the center of the map.
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
            marker.title = "Sydney"
            marker.snippet = "Australia"
            marker.map = self.googleMaps
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        
        let alert = UIAlertController(title: "info", message: error.localizedDescription, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
