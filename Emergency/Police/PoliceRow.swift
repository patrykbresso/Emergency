//
//  PoliceView.swift
//  Emergency
//
//  Created by stud on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI
import CoreLocation



struct PoliceRow: View {

    var policeStation: Police
    var body: some View {
        List{
            VStack {
                Text(policeStation.name)
                Text(policeStation.address)
                Text(policeStation.number)
                Text(policeStation.email)
            }
        }
    }
}

#if DEBUG
struct PoliceRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            PoliceRow(policeStation: policeData[0])
            PoliceRow(policeStation: policeData[1])
        }
        .previewLayout(.fixed(width: 300, height: 100))
    }
}
#endif
