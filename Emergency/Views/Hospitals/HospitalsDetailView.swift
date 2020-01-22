//
//  PoliceDetail.swift
//  Emergency
//
//  Created by Patryk Bresso on 16/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//


import SwiftUI

struct HospitalsDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var hospital: Hospitals
    
    var body: some View {
        
        
        VStack {
            HStack {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    VStack {
                        Image("hospital")
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
            
            MapView(coordinate: hospital.locationCoordinate)
                .frame(width: 346, height: 270, alignment: .center)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 3)
                )
            CircleImage(image: Image(hospital.imageName))
                .offset(y: -100)
                .padding(.bottom, -130)

            ZStack {
                RoundedRectangle(cornerRadius: 10)
                .stroke(Color.primaryPink, lineWidth: 10)
                .background(Color.primaryPink)
                .frame(width: 170, height: 120)
                VStack {
                    Text(hospital.name)
                        .bold()
                    Text(hospital.address)
                    Text(hospital.number)
                }
                .foregroundColor(.white)
            }
            .offset(y: 50)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color.primaryBlue)
        .edgesIgnoringSafeArea(.all)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
            
        
    }
}

struct HospitalsDetailView_Preview: PreviewProvider {
    static var previews: some View {
        HospitalsDetailView(hospital: hospitalsData[1])
    }
}
