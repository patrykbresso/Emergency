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
        
            ZStack() {
                RoundedRectangle(cornerRadius: 10)
                .fill(Color.primaryPink)

                VStack {
                    Text(self.policeStation.name)
                        .fontWeight(.bold)
                        .font(Font.custom("AvantGardeBold", size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 5)
                    Text(self.policeStation.address+" "+self.policeStation.postalCode+" "+self.policeStation.city)
                        .font(Font.custom("AvantGardeNormal", size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 5)
                    Text(self.policeStation.number.replacingOccurrences(of: ";", with: "\n"))
                        .font(Font.custom("AvantGardeNormal", size: 14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)
                }.font(.system(size: 15))
                 .padding(10)
            }
            .foregroundColor(.white)
    }
}

#if DEBUG
struct PoliceRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            PoliceRow(policeStation: policeData.police[0])
            PoliceRow(policeStation: policeData.police[1])
        }
    }
}
#endif
