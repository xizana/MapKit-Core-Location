//
//  MapKitView.swift
//  MapKit & Core Location
//
//  Created by Lasha Khizanishvili on 26.03.24.
//

import UIKit
import MapKit

class MapKitView: UIView {
    
    // MARK: - Properties
    
    private let mapView: MKMapView = {
       let mapView = MKMapView()
        mapView.showsUserLocation = true
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    // MARK: - init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions

    private func setupUI() {
        backgroundColor = .white
        addSubview(mapView)
        
        NSLayoutConstraint.activate([
            mapView.widthAnchor.constraint(equalTo: widthAnchor),
            mapView.heightAnchor.constraint(equalTo: heightAnchor)
        
        ])
    }
    
}


