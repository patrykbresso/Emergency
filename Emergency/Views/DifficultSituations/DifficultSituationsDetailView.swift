//
//  DifficultSituationsDetailView.swift
//  Emergency
//
//  Created by Paulina Binas on 07/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct DifficultSituationsDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var backButtonSize: CGRect = CGRect()
    let paddingSides = CGFloat(20)
    
    var difficultSituation: DifficultSituations
    
    var body: some View {
        VStack {
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
                Image("difficultsituations")
                    .renderingMode(.original)
                    .padding(.leading, -self.backButtonSize.width)
                Spacer()
            }.padding(15)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.primaryPink)
                VStack {
                    ScrollView {
                        Text(self.difficultSituation.title)
                            .fontWeight(.bold)
                            .font(Font.custom("AvantGardeBold", size: 14))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        Text(self.difficultSituation.text)
                            .font(Font.custom("AvantGardeNormal", size: 14))
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

struct DifficultSituationsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultSituationsDetailView(difficultSituation: difficultSituationsData[0])
    }
}
