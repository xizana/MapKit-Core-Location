//
//  ViewController.swift
//  MapKit & Core Location
//
//  Created by Lasha Khizanishvili on 26.03.24.
//

import UIKit
import Combine

class MapKitViewController: UIViewController {
    // MARK: - Properties
    
    private let mapKitView = MapKitView()
    private var subscriptions = Set<AnyCancellable>()
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mapKitView
        if #available(iOS 15.0, *) {
            bindings()
        }
    }
    
    // MARK: - Functions
    
    @available(iOS 15.0, *)
    private func bindings() {
        mapKitView.$searchState
            .sink { [weak self] state in
                if state == true {
                    self?.presentPlacesModal() {
                        self?.mapKitView.searchState = false
                    }
                }
            }.store(in: &subscriptions)
    }
    
    @available(iOS 15.0, *)
    private func presentPlacesModal(completion: @escaping () -> ()) {
        let placesTVC = PlacesTableViewController()
        mapKitView.$places
                   .sink { [weak self] places in
                       guard let self = self else { return }
                       if let places = places {
                           placesTVC.passingData(data: places)
                       }
                   }
                   .store(in: &subscriptions)
        
        placesTVC.modalPresentationStyle = .pageSheet
        if let sheet = placesTVC.sheetPresentationController {
            sheet.prefersGrabberVisible = true
            sheet.detents = [.medium(), .large()]
            self.present(placesTVC, animated: true)
        }
    }
    
    
}

