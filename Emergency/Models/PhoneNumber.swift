//
//  PhoneNumber.swift
//  Emergency
//
//  Created by Paulina Binas on 08/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import Foundation

struct PhoneNumber: Identifiable, Decodable {
    var id: Int
    var name: String
    var number: String
    var available: String
    var description: String
}
