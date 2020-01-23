
//
//  PoliceList.swift
//  Emergency
//
//  Created by Patryk Bresso on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//


import SwiftUI

struct ConsulatesView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var dataLoader: DataLoader
    
    var body: some View {

            ZStack() {
                VStack() {
                    HStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            VStack {
                                Image("left_arrow")
                                    .renderingMode(.original)
                            }
                        }
                        Spacer()
                        Image("consulate")
                            .renderingMode(.original)
                        Spacer()
                    }.padding(15)
                    ScrollView() {
                        Spacer()
                        VStack(alignment: .center, spacing: 30) {
                            ForEach(self.dataLoader.consulatesData) { consulate in
                                ConsulatesRow(consulate: consulate)
                            }
                        }.frame(width: UIScreen.screenWidth / 0.95, alignment: .center)
                    }
                }
            }
            .background(Color.primaryBlue
            .edgesIgnoringSafeArea(.all))
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }

}

struct ConsulatesView_Previews: PreviewProvider {
    static var previews: some View {
        ConsulatesView()
    }
}

