//
//  ViewController.swift
//  MapLocations
//
//  Created by Pramod Reddy Nomula on 24/08/2019.
//  Copyright © 2019 Pramod Reddy Nomula. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController : UIViewController  {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    @IBAction func setRegionForMap(_ sender: Any) {
        let location = CLLocation(latitude: 53.3204, longitude: -6.3523)
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
        
        let Avondale = MKPointAnnotation()
        Avondale.title = "Avondale"
        Avondale.coordinate = location.coordinate
        mapView.addAnnotation(Avondale)
        
 }
    
    
    
    
    
    override func viewDidLoad() {
        
        mapView.showsUserLocation = true
        if (LocationManager.locManager.checkLocationStatus())
        {
            LocationManager.locManager.startUpdatingLocations()
        }
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(MapViewController.updateMapsLocation(notification: )) , name: NSNotification.Name(rawValue: locationUpdateNotification), object: nil)
      super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  @objc func updateMapsLocation(notification: NSNotification){
    
    let location = notification.object as! CLLocation
    let regionRadius: CLLocationDistance = 1000
    let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
    mapView.setRegion(coordinateRegion, animated: true)
    
    let Avondale = MKPointAnnotation()
    Avondale.title = "currentLocation"
    Avondale.coordinate = location.coordinate
    mapView.addAnnotation(Avondale)
    
    let lat = location.coordinate.latitude
    let lon = location.coordinate.longitude
    print("notification Triggered");
    print("update location lat\(lat)")
    print("update location lon\(lon)")
    }

    
    @IBAction func segmentControllerClicked(_ sender: Any) {
        let segmentController = sender as! UISegmentedControl
        switch segmentController.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        default:
            mapView.mapType = .hybrid
        }
        
    }
    
    
    
    
    
 
    
}

