//
//  PoliceDetail.swift
//  Emergency
//
//  Created by Patryk Bresso on 16/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//


import SwiftUI

struct PoliceDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var policeStation: Police

    
    var body: some View {
        
        GeometryReader { geometry in
            VStack {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        VStack {
                            Image("police")
                                .renderingMode(.original)
                            Image("left_arrow")
                                .renderingMode(.original)
                        }.padding(.leading, 20)
                    }
                    Spacer()
                    Button(action: {
                        let formattedString = "http://maps.apple.com/maps?saddr=\(self.policeStation.coordinates.latitude),\(self.policeStation.coordinates.longitude)"
                        /*let deleteStreet = self.policeStation.address.replacingOccurrences(of: "ul. ", with: "")
                        let formattedStreet = deleteStreet.replacingOccurrences(of: " ", with: "+")
                        let formattedAddress = formattedStreet+","+self.policeStation.city
                        let formattedString = "http://maps.apple.com/maps?address=\(formattedAddress)"
                        print(formattedAddress)*/
                        let url: NSURL = URL(string: formattedString)! as NSURL
                        UIApplication.shared.open(url as URL)
                    }) {
                        Image("map")
                            .renderingMode(.original)
                    }.padding(.trailing, 20)
                }
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
                    .stroke(Color.primaryPink, lineWidth: 10)
                    .background(Color.primaryPink)
                        .frame(width: geometry.size.width / 1.25, height: geometry.size.height / 6)
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
}

struct PoliceDetailView_Preview: PreviewProvider {
    static var previews: some View {
        PoliceDetailView(policeStation: policeData[1])
    }
}

