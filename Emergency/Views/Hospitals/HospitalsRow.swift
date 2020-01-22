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
        
        GeometryReader { geometry in
            ZStack() {
                RoundedRectangle(cornerRadius: 10)
                .stroke(Color.primaryPink, lineWidth: 10)
                .background(Color.primaryPink)
                
                VStack {
                    Text(self.hospital.name)
                        .bold()
                    Text(self.hospital.address)
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
                }
            }
            .font(.system(size: 14))
            .frame(width: geometry.size.width / 1.3, height: geometry.size.height / 6)
            .foregroundColor(.white)
        }
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
