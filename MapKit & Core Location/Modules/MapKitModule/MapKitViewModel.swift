//
//  MapKitViewModel.swift
//  MapKit & Core Location
//
//  Created by Lasha Khizanishvili on 26.03.24.
//

import UIKit
import CoreLocation

class MapKitViewModel: NSObject {
    
    // MARK: - Properties
    
    
    
    
    // MARK: - init
    
    override init() {
        super.init()
    }
    
    
    // MARK: - Functions
    
    func locationManeger() {
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    
    private func checkLocationAuthorization() {
        
    }
}


extension MapKitViewModel: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("this is location \(locations)")

    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("this is error \(error)")
    }
}
