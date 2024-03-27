//
//  PlacesTableViewController.swift
//  MapKit & Core Location
//
//  Created by Lasha Khizanishvili on 27.03.24.
//

import UIKit
import MapKit


class PlacesTableViewController: UITableViewController {
    // MARK: - Properties
        
    func passingData(data: MKLocalSearch.Response) {
        
        print(data.mapItems.map{$0.name})
    }
    
}
