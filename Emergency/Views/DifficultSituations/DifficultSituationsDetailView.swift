//
//  DifficultSituationsDetailView.swift
//  Emergency
//
//  Created by Paulina Binas on 07/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct DifficultSituationsDetailView: View {
    var difficultSituation: DifficultSituations
    
    var body: some View {
        VStack {
            Text(difficultSituation.title)
                .font(.title)
                .padding(.bottom, 15)
            Text(difficultSituation.text)
            .padding(15)
        }
    }
}

struct DifficultSituationsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultSituationsDetailView(difficultSituation: difficultSituationsData[0])
    }
}
