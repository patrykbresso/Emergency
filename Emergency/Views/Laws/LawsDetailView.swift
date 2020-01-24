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
                }.padding(15)
                Spacer()
                    VStack {
                        ScrollView {
                            Text(self.law.title)
                                .bold()
                            Spacer()
                            Text(self.law.text)
                        }
                    }
                    .frame(width: UIScreen.screenWidth / 1.3, alignment: .center)
                    .foregroundColor(.white)
                    .background(Color.primaryPink)
                    .cornerRadius(10)
               
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


