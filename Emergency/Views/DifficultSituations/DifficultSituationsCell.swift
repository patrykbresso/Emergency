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
            .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
            .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
            
            Text(difficultSituation.title)
        }
        .foregroundColor(.white)
    }
}

struct DifficultSituationsCell_Previews: PreviewProvider {
    static var previews: some View {
        DifficultSituationsCell(difficultSituation: difficultSituationsData[0])
    }
}
