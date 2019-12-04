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
        

            ZStack() {
                RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                
                VStack {
                    Text(policeStation.name)
                        .bold()
                    Text(policeStation.address)
                    Text(policeStation.number)
                    Text(policeStation.email)
                }
            }
            .foregroundColor(.white)
    }
}

#if DEBUG
struct PoliceRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            PoliceRow(policeStation: policeData[0])
            PoliceRow(policeStation: policeData[1])
        }
    }
}
#endif
