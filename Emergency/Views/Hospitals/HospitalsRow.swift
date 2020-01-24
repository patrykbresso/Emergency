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

    var hospital: Hospital
    var body: some View {

            ZStack() {
                RoundedRectangle(cornerRadius: 10)
                .fill(Color.primaryPink)
                
                VStack {
                    Text(self.hospital.name)
                        .bold()
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                    Text(self.hospital.address)
                        .multilineTextAlignment(.center)
                    Button(action: {
                        let cleanString = String(self.hospital.number.filter { !" \n\t\r".contains($0) })
                        let tel = "tel://"
                        let formattedString = tel + cleanString
                        let url: NSURL = URL(string: formattedString)! as NSURL
                        UIApplication.shared.open(url as URL)
                       }) {
                       Text(self.hospital.number)
                        .bold()
                    }
                }.padding(5)
            }.font(.system(size: 14))
            .foregroundColor(.white)
        
    }
}

#if DEBUG
struct HospitalsRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            HospitalsRow(hospital: hospitalsData.hospitals[0])
            HospitalsRow(hospital: hospitalsData.hospitals[0])
        }
        .previewLayout(.fixed(width: 300, height: 100))
    }
}
#endif
