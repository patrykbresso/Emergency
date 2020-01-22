//
//  Police.swift
//  Emergency
//
//  Created by Patryk Bresso on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import Foundation
import CoreLocation
import SwiftUI
import MapKit

struct Police: Identifiable, Decodable {
    var id: Int
    var name: String
    var address: String
    var postalCode: String
    var city: String
    var number: String
    var imageName: String
    var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
    
    
    func loadListOfPolicePins(listOfDepartments: [Police]) -> [MKMapItem] {
        var listOfPoliceDepartments: [MKMapItem] = []
        var policeDepartment: MKMapItem
        for index in 0..<listOfPoliceDepartments.count {
            let latitude = listOfDepartments[index].locationCoordinate.latitude
            let longitude = listOfDepartments[index].locationCoordinate.longitude
            let coordinate = CLLocationCoordinate2D(latitude: latitude,longitude: longitude)
            
            let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
            policeDepartment = MKMapItem(placemark: placemark)
            policeDepartment.name = listOfDepartments[index].name
            listOfPoliceDepartments.append(policeDepartment)
        }
        return listOfPoliceDepartments
    }
    
    
}

struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
}



