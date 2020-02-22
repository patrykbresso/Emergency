//
//  PoliceList.swift
//  Emergency
//
//  Created by Patryk Bresso on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//


import SwiftUI

struct HospitalsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var dataLoader: DataLoader
    @State var backButtonSize: CGRect = CGRect()
    let paddingSides = CGFloat(20)
    
    var body: some View {
          
        GeometryReader { geometry in
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
                        }.background(GeometryGetter(rect: self.$backButtonSize))
                        Spacer()
                        Image("hospital")
                            .renderingMode(.original)
                            .padding(.leading, -self.backButtonSize.width)
                        Spacer()
                    }
                    ZStack() {
                        RoundedRectangle(cornerRadius: 10)
                        .fill(Color.primaryPink)
                        
                        VStack {
                            Text(self.dataLoader.hospitalsData.title)
                                .fontWeight(.bold)
                                .font(Font.custom("AvantGardeBold", size: 14))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .fixedSize(horizontal: false, vertical: true)
                            Text(self.dataLoader.hospitalsData.subtitle)
                                .font(Font.custom("AvantGardeNormal", size: 14))
                            }.padding(10)
                        .layoutPriority(1)
                        }
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    
                    ScrollView() {
                        Spacer()
                        VStack(alignment: .center, spacing: 30) {
                            ForEach(self.dataLoader.hospitalsData.hospitals) { hospital in
                                HospitalsRow(hospital: hospital)
                            }
                        }
                    }
                }
                .frame(width: UIScreen.screenWidth / 1.3, alignment: .center)
            }
            .padding([.leading, .trailing], self.paddingSides)
        }
        
        .background(Color.primaryBlue
        .edgesIgnoringSafeArea(.all))
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }

}

struct HospitalsView_Previews: PreviewProvider {
    static var previews: some View {
        HospitalsView()
    }
}
