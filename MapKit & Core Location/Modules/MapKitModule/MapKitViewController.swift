//
//  ViewController.swift
//  MapKit & Core Location
//
//  Created by Lasha Khizanishvili on 26.03.24.
//

import UIKit

class MapKitViewController: UIViewController {
    // MARK: - Properties
    
    private let mapKitView = MapKitView()
    
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mapKitView
    }

}

