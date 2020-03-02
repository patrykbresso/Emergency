//
//  LawView.swift
//  Emergency
//
//  Created by stud on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct LawsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var dataLoader: DataLoader
    @State var backButtonSize: CGRect = CGRect()
    let paddingSides = CGFloat(20)
    let minus = CGFloat(100)
    
    var body: some View {

        VStack(spacing: 8) {
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
                    Image("law")
                        .renderingMode(.original)
                        .padding(.leading, -self.backButtonSize.width)
                    Spacer()
                    NavigationLink(destination: DropDown()) {
                        Text("...")
                            .foregroundColor(Color.primaryPink)
                            .font(Font.custom("ITCAvantGardePro-Bold", size: 18))
                    }

                }.padding(.bottom, 20)
            ScrollView {
                VStack {
                    ForEach((0...(self.dataLoader.lawsData.count - 2)), id: \.self) { i in
                        
                        HStack(spacing: 20) {
                                if(i % 2 == 0) {
                                    NavigationLink(destination: LawsDetailView(law: self.dataLoader.lawsData[i])) {
                                        LawsCell(law: self.dataLoader.lawsData[i])
                                    }.frame(width: UIScreen.screenWidth / 2 - 2 * self.paddingSides, height: UIScreen.screenHeight / 7)
                                    
                                    NavigationLink(destination: LawsDetailView(law: self.dataLoader.lawsData[i + 1])) {
                                        LawsCell(law: self.dataLoader.lawsData[i + 1])
                                    }.frame(width: UIScreen.screenWidth / 2 - 2 * self.paddingSides, height: UIScreen.screenHeight / 7)
                                }
                        }.padding(.bottom, 10)
                    }
                    NavigationLink(destination: LawsDetailView(law: self.dataLoader.lawsData[self.dataLoader.lawsData.count - 1])) {
                        LawsCell(law: self.dataLoader.lawsData[self.dataLoader.lawsData.count - 1])
                    }.frame(width: UIScreen.screenWidth / 2 - 2 * self.paddingSides, height: UIScreen.screenHeight / 11)
                }.padding(.top, 10)
            }
        }

        .padding([.leading, .trailing, .bottom], self.paddingSides)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.primaryBlue
            .edgesIgnoringSafeArea(.all)
        )
        
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#if DEBUG
struct LawsView_Previews: PreviewProvider {
    static var previews: some View {
        LawsView()
    }
}
#endif
