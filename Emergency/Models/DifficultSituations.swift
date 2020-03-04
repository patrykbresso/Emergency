//
//  DifficultSituations.swift
//  Emergency
//
//  Created by Paulina Binas on 07/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import Foundation

struct DifficultSituations: Identifiable, Decodable {
    var id: Int
    var title: String
    var text: String
    var phone: String?
    var text2: String?
}
