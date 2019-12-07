//
//  PoliceView.swift
//  Emergency
//
//  Created by stud on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI
import CoreLocation



struct HospitalsRow: View {

    var hospital: Hospitals
    var body: some View {
        

            ZStack() {
                RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                
                VStack {
                    Text(hospital.name)
                        .bold()
                    Text(hospital.address)
                    Text(hospital.number)
                    Text(hospital.email)
                }
            }
            .foregroundColor(.white)
            .frame(width: 200, height: 80)
    }
}

#if DEBUG
struct HospitalsRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            HospitalsRow(hospital: hospitalsData[0])
            HospitalsRow(hospital: hospitalsData[0])
        }
        .previewLayout(.fixed(width: 300, height: 100))
    }
}
#endif
