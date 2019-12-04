//
//  Law.swift
//  Emergency
//
//  Created by Patryk Bresso on 04/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import Foundation

struct Laws: Identifiable, Decodable {
    var id: Int
    var title: String
    var text: String
}
