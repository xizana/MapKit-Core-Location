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
    
}


