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
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            if(title.name != "") {
                Text(title.name)
                    .bold()
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
            }
        }.foregroundColor(Color.white)
    }
}
