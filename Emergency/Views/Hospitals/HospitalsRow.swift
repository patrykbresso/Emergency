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

    @State var listOFNumbers = [Numbers]()
    
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
                    .padding(.bottom, 5)
                    Text(self.hospital.address)
                        .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 5)
                    ForEach(listOFNumbers) { number in
                    Button(action: {
                        let cleanString = String(number.name.filter { !" \n\t\r".contains($0) })
                        let tel = "tel://"
                        let formattedString = tel + cleanString
                        let url: NSURL = URL(string: formattedString)! as NSURL
                        UIApplication.shared.open(url as URL)
                       }) {
                        Text(number.name)
                        .bold()
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 5)
                    }
                    }
                }.padding(5)
                .onAppear() {
                self.listOFNumbers = self.dividePhoneNumbers(stringNumbers: self.hospital.number)
                }
            }.font(.system(size: 14))
            .foregroundColor(.white)
        
    }
    
    func dividePhoneNumbers(stringNumbers: String) -> [Numbers]{
           var numbers = [Numbers]()
           let array = stringNumbers.components(separatedBy: ";")
           
           
           for i in array {
               let uuid = UUID()
               numbers.append(Numbers(id: uuid, name: i))
           }
       return numbers
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
