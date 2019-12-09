//
//  Police.swift
//  Emergency
//
//  Created by Patryk Bresso on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import Foundation
import CoreLocation

struct Consulates: Identifiable, Decodable {
    var id: Int
    var name: String
    var consulName: String
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


