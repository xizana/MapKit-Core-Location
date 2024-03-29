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
    
    
    // MARK: - init
    
    init() {
        super.init(nibName: nil, bundle: nil)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var placesData: [MKLocalSearch.Response] = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        placesData.map { $0.mapItems.count }.reduce(0, +)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let mapItems = placesData[indexPath.section].mapItems
        
        if indexPath.row < mapItems.count {
            let name = mapItems[indexPath.row].name ?? ""
            cell.textLabel?.text = name
        } else {
            cell.textLabel?.text = ""
        }
        
        return cell
    }
    
    
    // MARK: - Functions
    
    func passingData(data: MKLocalSearch.Response) {
        self.placesData = [data]
    }
    
}
