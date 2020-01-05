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
    @EnvironmentObject var dataLoader: DataLoader
    var policeStation: Police
    var body: some View {
        

        GeometryReader { geometry in
            ZStack() {
                RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                
                VStack {
                    Text(self.policeStation.name)
                        .bold()
                    Text(self.policeStation.address+self.policeStation.postalCode+self.policeStation.city)
                    Text(self.policeStation.number)
                }.font(.system(size: 15))
            }.frame(width: geometry.size.width / 1.25, height: geometry.size.height / 6)
            .foregroundColor(.white)
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
    }
}
#endif
