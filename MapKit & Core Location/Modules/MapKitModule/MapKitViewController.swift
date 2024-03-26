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
    private let mapKitVM: MapKitViewModel
    
    init(mapKitVM: MapKitViewModel = MapKitViewModel()) {
        self.mapKitVM = mapKitVM
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mapKitView
        mapKitVM.locationManeger()
    }


}

