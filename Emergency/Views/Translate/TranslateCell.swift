//
//  TranslateCell.swift
//  Emergency
//
//  Created by Paulina Binas on 08/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct TranslateCell: View {
    var row: Translate
    var showTranslation: Bool
    @EnvironmentObject var dataLoader: DataLoader
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
            .fill(Color.primaryPink)
            
            if(!showTranslation) {
                Text(row.translation)
                    .font(Font.custom("AvantGardeNormal", size: 14))
                    .padding(5)
            } else {
                Text(row.originalText)
                    .font(Font.custom("AvantGardeNormal", size: 14))
                    .padding(5)
            }
        }.multilineTextAlignment(.center)
        .foregroundColor(.white)
    }
}

struct TranslateCell_Previews: PreviewProvider {
    static var previews: some View {
        TranslateCell(row: translateData[0], showTranslation: false)
    }
}
