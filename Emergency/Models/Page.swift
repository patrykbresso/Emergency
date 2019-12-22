//
//  Page.swift
//  Emergency
//
//  Created by Paulina Binas on 13/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct Page: Decodable, Identifiable {
    var id: Int
    var name: String
    var page: Int
    var pageName: String
}
