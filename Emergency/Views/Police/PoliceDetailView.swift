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
                }) {
                    Image("map")
                        .renderingMode(.original)
                }.padding(.trailing, 20)
            }
            
            MapView(coordinate: policeStation.locationCoordinate)
                .frame(width: 346, height: 270, alignment: .center)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 3)
                )
            CircleImage(image: Image(policeStation.imageName))
                .offset(y: -100)
                .padding(.bottom, -130)

            ZStack {
                RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                .frame(width: 170, height: 120)
                VStack {
                    Text(policeStation.name)
                        .bold()
                    Text(policeStation.address)
                    Text(policeStation.number)
                    Text(policeStation.email)
                }
                .foregroundColor(.white)
            }
            .offset(y: 50)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255))
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
            
        
    }
}

struct PoliceDetailView_Preview: PreviewProvider {
    static var previews: some View {
        PoliceDetailView(policeStation: policeData[1])
    }
}

