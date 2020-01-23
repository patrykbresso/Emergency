//
//  PoliceDetail.swift
//  Emergency
//
//  Created by Patryk Bresso on 16/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//


import SwiftUI
import MapKit

struct PoliceDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var policeStation: Police

    
    var body: some View {

            VStack {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("left_arrow")
                            .renderingMode(.original)
                    }
                    Spacer()
                    Image("police")
                        .renderingMode(.original)
                    Spacer()
                    Button(action: {
                        
                        let coordinate = CLLocationCoordinate2D(latitude: self.policeStation.coordinates.latitude,longitude: self.policeStation.coordinates.longitude)
                        
                        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
                        let mapItem = MKMapItem(placemark: placemark)
                        mapItem.name = self.policeStation.name
                        mapItem.openInMaps(launchOptions: nil)

                    }) {
                        Image("map")
                            .renderingMode(.original)
                    }
                }.padding(15)
                Spacer(minLength: 20)
                
                MapView(coordinate: self.policeStation.locationCoordinate)
                    .frame(width: 346, height: 270, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.white, lineWidth: 3)
                    )
                CircleImage(image: Image(self.policeStation.imageName).resizable())
                .frame(width: 180, height: 180)
                    .offset(y: -100)

                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.primaryPink)
                        .frame(width: UIScreen.screenWidth / 1.25, height: UIScreen.screenHeight / 6)
                    VStack {
                        Text(self.policeStation.name)
                            .bold()
                        Text(self.policeStation.address)
                        Button(action: {
                            let cleanString = String(self.policeStation.number.filter { !" \n\t\r".contains($0) })
                            let tel = "tel://"
                            let formattedString = tel + cleanString
                            let url: NSURL = URL(string: formattedString)! as NSURL
                            UIApplication.shared.open(url as URL)
                           }) {
                           Text(self.policeStation.number)
                            .bold()
                        }
                    }
                    .foregroundColor(.white)
                }
                Spacer()
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(Color.primaryBlue
            .edgesIgnoringSafeArea(.all)
            )
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
        
        
    }
}

struct PoliceDetailView_Preview: PreviewProvider {
    static var previews: some View {
        PoliceDetailView(policeStation: policeData.police[1])
    }
}

