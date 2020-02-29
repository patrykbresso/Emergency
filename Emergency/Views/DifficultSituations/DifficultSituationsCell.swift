//
//  DifficultSituationsCell.swift
//  Emergency
//
//  Created by Paulina Binas on 07/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct DifficultSituationsCell: View {
    var difficultSituation: DifficultSituations
    
    var body: some View {
        ZStack() {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.primaryPink)
            
            Text(difficultSituation.title)
                .font(Font.custom("ITCAvantGardePro-Bk", size: 14))
                .multilineTextAlignment(.center)
                .font(.system(size: 14))
                .lineLimit(5)
                .padding(5)
        }
        .foregroundColor(.white)
    }
}

struct DifficultSituationsCell_Previews: PreviewProvider {
    static var previews: some View {
        DifficultSituationsCell(difficultSituation: difficultSituationsData[0])
    }
}
