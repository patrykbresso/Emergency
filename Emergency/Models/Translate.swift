//
//  Translate.swift
//  Emergency
//
//  Created by Paulina Binas on 08/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import Foundation

struct Translate: Identifiable, Decodable {
    var id: Int
    var originalText: String
    var translation: String
}
