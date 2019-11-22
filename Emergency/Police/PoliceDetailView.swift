//
//  PoliceDetail.swift
//  Emergency
//
//  Created by Patryk Bresso on 16/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//


import SwiftUI

struct PoliceDetailView: View {
    
    var policeStation: Police

    var body: some View {
        VStack {
           
                
            MapView(coordinate: policeStation.locationCoordinate)
                .offset(y: 0)
                .frame(width: 346, height: 270, alignment: .center)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 3)
                )
            CircleImage(image: Image(policeStation.imageName))
                .offset(y: -100)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                .frame(width: 170, height: 120)
                .offset(y: 40)
                Text(policeStation.name)
                    .padding(.top, 15)
                    .padding(.leading, 5)
                    .padding(.trailing, 5)
                    .foregroundColor(.white)
                    .offset(y: -100)
                Text(policeStation.address)
                    .padding(.top, 15)
                    .padding(.leading, 5)
                    .padding(.trailing, 5)
                    .foregroundColor(.white)
                    .offset(y: -115)
                Text(policeStation.number)
                    .padding(.top, 15)
                    .padding(.leading, 5)
                    .padding(.trailing, 5)
                    .foregroundColor(.white)
                    .offset(y: -130)
                Text(policeStation.email)
                    .padding(.top, 15)
                    .padding(.leading, 5)
                    .padding(.trailing, 5)
                    .foregroundColor(.white)
                    .offset(y: -145)
                
            }
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255))
        .edgesIgnoringSafeArea(.all)
    }
}

struct PoliceDetailView_Preview: PreviewProvider {
    static var previews: some View {
        PoliceDetailView(policeStation: policeData[1])
    }
}

