//
//  Footer.swift
//  Emergency
//
//  Created by Patryk Bresso on 22/01/2020.
//  Copyright © 2020 Wasko. All rights reserved.
//

import Foundation

struct Footer: Decodable  {
    var title: [Title]
    var changeLanguage: String
}

struct Title: Identifiable, Decodable {
    var id: Int
    var text: String
    var name: String
}


