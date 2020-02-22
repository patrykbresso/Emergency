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
                .font(Font.custom("AvantGardeNormal", size: 14))
            if(title.name != "") {
                Text(title.name)
                    .fontWeight(.bold)
                    .font(Font.custom("AvantGardeBold", size: 14))
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
            }
        }.foregroundColor(Color.white)
    }
}
