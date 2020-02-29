//
//  LawsDetailView.swift
//  Emergency
//
//  Created by Patryk Bresso on 04/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct LawsDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var backButtonSize: CGRect = CGRect()
    let paddingSides = CGFloat(20)
    
    var law: Laws

    
    var body: some View {

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
                    Image("law")
                        .renderingMode(.original)
                        .padding(.leading, -self.backButtonSize.width)
                    Spacer()
                    NavigationLink(destination: DropDown()) {
                        Text("...")
                            .foregroundColor(Color.primaryPink)
                            .bold()
                    }
                }.padding(15)
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.primaryPink)
                    VStack {
                        ScrollView(showsIndicators: false) {
                            Text(self.law.title)
                                .fontWeight(.bold)
                                .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                            Spacer()
                            Text(self.law.text)
                                .font(Font.custom("ITCAvantGardePro-Bk", size: 14))
                        }.padding(10)
                    }
                        
                    .foregroundColor(.white)
                }.frame(width: UIScreen.screenWidth / 1.3, alignment: .center)
                Spacer(minLength: UIScreen.screenHeight / 10)
            }
            .padding([.leading, .trailing], self.paddingSides)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.primaryBlue
                .edgesIgnoringSafeArea(.all)
            )
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        
        
    }
}

struct LawsDetailView_Preview: PreviewProvider {
    static var previews: some View {
        LawsDetailView(law: lawsData[0])
    }
}


