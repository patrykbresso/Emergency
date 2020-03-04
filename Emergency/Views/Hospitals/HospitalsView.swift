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
                        NavigationLink(destination: DropDown()) {
                            Text("...")
                                .foregroundColor(Color.primaryPink)
                                .font(Font.custom("ITCAvantGardePro-Bold", size: 18))
                        }
                    }.padding(.bottom, 20)
                    ZStack() {
                        RoundedRectangle(cornerRadius: 10)
                        .fill(Color.primaryPink)
                        
                        VStack {
                            Text(self.dataLoader.hospitalsData.title)
                                .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                                .lineSpacing(5.0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.bottom, 5)
                            Text(self.dataLoader.hospitalsData.subtitle)
                                .font(Font.custom("ITCAvantGardePro-Bk", size: 14))
                                .lineSpacing(5.0)
                            }.padding(10)
                        .layoutPriority(1)
                        }
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .padding(.bottom, 15)
                    ScrollView(showsIndicators: false) {
                        Spacer()
                        VStack(alignment: .center, spacing: 30) {
                            ForEach(self.dataLoader.hospitalsData.hospitals) { hospital in
                                HospitalsRow(hospital: hospital)
                            }
                        }
                    }
                }

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
