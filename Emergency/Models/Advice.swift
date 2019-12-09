//
//  Advice.swift
//  Emergency
//
//  Created by Paulina Binas on 07/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import Foundation

struct Advice: Decodable {
    var intro: String
    var advice: [AdviceTexts]
}

struct AdviceTexts: Identifiable, Decodable {
    var id: Int
    var text: String
}
