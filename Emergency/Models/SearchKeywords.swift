//
//  SearchKeywords.swift
//  Emergency
//
//  Created by Paulina Binas on 13/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import Foundation

struct SearchKeywords: Decodable {
    var language: String
    var views: [Views]
}

struct Views: Identifiable, Decodable {
    var id: Int
    var name: String
    var page: Int
    var keywords: [Keyword]
}

struct Keyword: Decodable {
    var keyword: String
}