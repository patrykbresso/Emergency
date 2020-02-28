//
//  PoliceView.swift
//  Emergency
//
//  Created by stud on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI
import CoreLocation
import MapKit


struct HospitalsRow: View {

    @State var listOFNumbers = [Numbers]()
    
    var hospital: Hospital
    var body: some View {

            ZStack() {
                RoundedRectangle(cornerRadius: 10)
                .fill(Color.primaryPink)
                
                VStack {
                    Text(self.hospital.name)
                        .fontWeight(.bold)
                        .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom, 5)
                    
                    Button(action: {
                        
                        
                        let addressString = self.hospital.address
                        CLGeocoder().geocodeAddressString(addressString,
                                completionHandler: {(placemarks, error) in
                            
                            if error != nil {
                                print("Geocode failed with error: \(error!.localizedDescription)")
                            } else if let marks = placemarks, marks.count > 0 {
                                let placemark = marks[0]
                                if let location = placemark.location {
                                    let coords = location.coordinate
                                
                                    let place = MKPlacemark(coordinate: coords, addressDictionary: nil)
                                    let mapItem = MKMapItem(placemark: place)
                                    mapItem.name = self.hospital.name
                                    mapItem.openInMaps(launchOptions: nil)
                                }
                            }
                        })
                    }){
                        Text(self.hospital.address)
                            .font(Font.custom("ITCAvantGardePro-Bk", size: 14))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 5)
                    }
                    ForEach(listOFNumbers) { number in
                        Button(action: {
                            let cleanString = String(number.name.filter { !" \n\t\r".contains($0) })
                            let tel = "tel://"
                            let formattedString = tel + cleanString
                            let url: NSURL = URL(string: formattedString)! as NSURL
                            UIApplication.shared.open(url as URL)
                           }) {
                            Text(number.name)
                            .fontWeight(.bold)
                            .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                            .frame(maxWidth: .infinity, alignment: .leading)
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
