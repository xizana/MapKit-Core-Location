//
//  MapKitView.swift
//  MapKit & Core Location
//
//  Created by Lasha Khizanishvili on 26.03.24.
//

import UIKit
import MapKit
import CoreLocation

class MapKitView: UIView {
    
    // MARK: - Properties
    
    let locationManager = CLLocationManager()
    
    private let mapView: MKMapView = {
       let mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    private let searchTextField: UITextField = {
       let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 12
        textField.placeholder = "Search"
        textField.backgroundColor = .white
        textField.leftViewMode = .always
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        return textField
    }()
    
    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        locationManeger()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions

    private func setupUI() {
        backgroundColor = .white
        addSubview(mapView)
        addSubview(searchTextField)
        bringSubviewToFront(searchTextField)
        
        NSLayoutConstraint.activate([
            mapView.widthAnchor.constraint(equalTo: widthAnchor),
            mapView.heightAnchor.constraint(equalTo: heightAnchor),
            
            searchTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25),
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            searchTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            searchTextField.heightAnchor.constraint(equalToConstant: 50)

        ])
    }
    
    
    func locationManeger() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        locationManager.requestLocation()
    }
    
    
    @available(iOS 14.0, *)
    private func checkLocationAuthorization() {
        guard let location = locationManager.location else { return }
        
        let coordinate = location.coordinate
        
        switch locationManager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse:
            let region = MKCoordinateRegion(center: coordinate , latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
        case .denied:
            return
        case .notDetermined, .restricted:
            return
        @unknown default:
            return
        
        }
        
        
       
        
    }
}


@available(iOS 14.0, *)
extension MapKitView: CLLocationManagerDelegate {
    
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
