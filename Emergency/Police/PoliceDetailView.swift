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
                .frame(height: 300)

            CircleImage(image: Image(policeStation.imageName))
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                Text(policeStation.name)
                    .font(.title)

                HStack(alignment: .top) {
                    Text(policeStation.address)
                        .font(.subheadline)
                    Spacer()
                    Text(policeStation.email)
                        .font(.subheadline)
                }
            }
            .padding()

            Spacer()
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
