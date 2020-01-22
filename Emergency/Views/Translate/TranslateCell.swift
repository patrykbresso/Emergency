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
            .stroke(Color.primaryPink, lineWidth: 10)
            .background(Color.primaryPink)
            
            if(!showTranslation) {
                Text(row.translation)
            } else {
                Text(row.originalText)
            }
        }.foregroundColor(.white)
    }
}

struct TranslateCell_Previews: PreviewProvider {
    static var previews: some View {
        TranslateCell(row: translateData[0], showTranslation: false)
    }
}
