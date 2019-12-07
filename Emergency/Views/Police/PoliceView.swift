
//
//  PoliceList.swift
//  Emergency
//
//  Created by Patryk Bresso on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//


import SwiftUI

struct PoliceView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
           
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    VStack {
                        Image("police")
                            .renderingMode(.original)
                        Image("left_arrow")
                            .renderingMode(.original)
                    }
                }

                VStack(spacing: 40) {
                    ForEach(policeData) { policeStation in
                            NavigationLink(destination: PoliceDetailView(policeStation: policeStation)) {
                                PoliceRow(policeStation: policeStation)
                                }
                    }
                }
                .frame(width: geometry.size.width / 1.3)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255)
            .edgesIgnoringSafeArea(.all)
        )
        .navigationBarBackButtonHidden(true)
    }
}

struct PoliceView_Previews: PreviewProvider {
    static var previews: some View {
        PoliceView()
    }
}

