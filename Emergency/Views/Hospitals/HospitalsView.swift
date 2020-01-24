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
                        .stroke(Color.primaryPink, lineWidth: 10)
                        .background(Color.primaryPink)
                        
                        VStack {
                            Text(self.dataLoader.hospitalsData.title)
                                .bold()
                            Text(self.dataLoader.hospitalsData.subtitle)
                        }
                        .multilineTextAlignment(.center)
                        
                        }
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .frame(width: geometry.size.width / 1.3, height: geometry.size.height / 4.5)
                    ScrollView() {
                        Spacer()
                        VStack(alignment: .center, spacing: 30) {
                            ForEach(self.dataLoader.hospitalsData.hospitals) { hospital in
                                HospitalsRow(hospital: hospital)
                            }
                        }
                    }
                }
            }
        }
        .padding([.leading, .trailing], self.paddingSides)
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
