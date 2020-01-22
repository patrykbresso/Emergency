//
//  Police.swift
//  Emergency
//
//  Created by Patryk Bresso on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import Foundation
import CoreLocation

struct HospitalsList: Decodable {
    var title: String
    var subtitle: String
    var hospitals: [Hospital]
}

struct Hospital: Identifiable, Decodable {
    var id: Int
    var name: String
    var address: String
    var number: String
    var imageName: String
    var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }
}
