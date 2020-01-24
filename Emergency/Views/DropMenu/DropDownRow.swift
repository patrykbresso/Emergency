//
//  DropDownRow.swift
//  Emergency
//
//  Created by Paulina Binas on 24/01/2020.
//  Copyright © 2020 Wasko. All rights reserved.
//

import SwiftUI

struct DropDownRow: View {
    var title: Title
    
    var body: some View {
        VStack {
            Text(title.text)
                .multilineTextAlignment(.center)
            if(title.name != "") {
                Text(title.name)
                    .bold()
                    .multilineTextAlignment(.center)
            }
        }.foregroundColor(Color.white)
    }
}
