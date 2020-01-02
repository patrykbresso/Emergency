//
//  SearchController.swift
//  Emergency
//
//  Created by Paulina Binas on 02/01/2020.
//  Copyright © 2020 Wasko. All rights reserved.
//

import SwiftUI

struct SearchController {
    @State var dataLoader: DataLoader
    @State var show: Bool = false
    
    func searchByKeywords(searchedPhrase: String) -> [Page] {
        var results: [Page] = []
        var i: Int = 1
        for view in dataLoader.searchKeywords {
            for word in view.keywords {
                if(searchedPhrase.lowercased().contains(word.keyword.lowercased())) {
                    let result: Page = Page(id: i,name: view.name, page: view.page, pageName: view.title, pageSubtitle: view.subtitle)
                    i = i + 1
                    results.append(result)
                }
            }
        }
        return results
    }
}
