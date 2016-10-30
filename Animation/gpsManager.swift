//
//  gpsManager.swift
//  Animation
//
//  Created by Felipe on 12/07/2015.
//  Copyright (c) 2015 fastman. All rights reserved.
//

import Foundation
import CoreLocation

class GPSManager: NSObject, CLLocationManagerDelegate {
        
    var locationManager: CLLocationManager!
    var seenError : Bool = false
    
        
    func findMyLocation() {
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.distanceFilter  = 3000 // Must move at least 3km
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer // Accurate within a kilometer
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        print("didChangeAuthorizationStatus")
        
        switch status {
        case .notDetermined:
            print(".NotDetermined")
            break
            
        case .authorizedWhenInUse:
            print(".Authorized")
            self.locationManager.startUpdatingLocation()
            break
            
        case .denied:
            print(".Denied")
            break
            
        default:
            print("Unhandled authorization status")
            break
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager.stopUpdatingLocation()
        if ((error) != nil) {
            if (seenError == false) {
                seenError = true
                print(error)
            }
        }
    }
    
    func returnLocationLatLon() -> (lat: Double, lon: Double) {
        
        let latValue: Double = locationManager.location!.coordinate.latitude
        let lonValue: Double = locationManager.location!.coordinate.longitude
        
        return (latValue,lonValue)
        
    }
    
}

