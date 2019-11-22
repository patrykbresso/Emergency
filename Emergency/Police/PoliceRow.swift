//
//  PoliceView.swift
//  Emergency
//
//  Created by stud on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI
import CoreLocation



struct PoliceRow: View {

    var policeStation: Police
    var body: some View {
        
        List{
            VStack {
                RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                .frame(width: 170, height: 80)
                .offset(y: 0)
                
                Text(policeStation.name)
                .padding(.top, 20)
                .padding(.leading, 5)
                .padding(.trailing, 5)
                .offset(y: -110)
                Text(policeStation.address)
                .padding(.top, 15)
                .padding(.leading, 5)
                .padding(.trailing, 5)
                .offset(y: -125)
                Text(policeStation.number)
                .padding(.top, 15)
                .padding(.leading, 5)
                .padding(.trailing, 5)
                .offset(y: -140)
                Text(policeStation.email)
                .padding(.top, 15)
                .padding(.leading, 5)
                .padding(.trailing, 5)
                .offset(y: -155)
                
                
            }.listRowBackground(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255))
                .foregroundColor(.white)
                .offset(x: 0)
                //.background(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255))
            //.listRowBackground(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255))
            //.colorMultiply(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255)).padding(.top)
        }
    }
}

#if DEBUG
struct PoliceRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            PoliceRow(policeStation: policeData[0])
            PoliceRow(policeStation: policeData[1])
        }
        .previewLayout(.fixed(width: 300, height: 100))
    }
}
#endif
