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
                .lineSpacing(5.0)
                .fixedSize(horizontal: false, vertical: true)
                .font(Font.custom("ITCAvantGardePro-Bk", size: 14))
            if(title.name != "") {
                
                Text(title.name)
                    .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                    .lineSpacing(5.0)
                    .lineLimit(nil)
                    .lineSpacing(5.0)
                    .fixedSize(horizontal: false, vertical: true)
                    .multilineTextAlignment(.center)
                    .padding(.top, 5)
            }
        }.foregroundColor(Color.white)
    }
}
