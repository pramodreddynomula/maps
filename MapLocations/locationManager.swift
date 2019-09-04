//
//  locationManager.swift
//  MapLocations
//
//  Created by Pramod Reddy Nomula on 24/08/2019.
//  Copyright © 2019 Pramod Reddy Nomula. All rights reserved.
//

import Foundation
import CoreLocation

class LocationManager : NSObject, CLLocationManagerDelegate {
    var coreLocation : CLLocationManager = CLLocationManager()
    
    static let locManager = LocationManager()
    func startUpdatingLocations(){
        coreLocation.delegate = self
        coreLocation.startUpdatingLocation()
        coreLocation.desiredAccuracy = kCLLocationAccuracyBest
    }
    func stopUpdatingLocations(){
        coreLocation.stopUpdatingLocation()
    }
    
    func requestAuthorisation(){
        coreLocation.requestAlwaysAuthorization()
        
    }
    func checkLocationStatus() -> Bool{
        let status = CLLocationManager.authorizationStatus()
        if (status == .authorizedAlways){
        return true
    }
    else {
    return false
    }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    
       
        let location = locations.last
        var lat = location?.coordinate.latitude
        var lon = location?.coordinate.longitude
        NotificationCenter.default.post(name: Notification.Name(rawValue: locationUpdateNotification), object: location)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print("didFailwithError \(error)")
    }
    
}

