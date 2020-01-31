//
//  DropDown.swift
//  Emergency
//
//  Created by Patryk Bresso on 21/01/2020.
//  Copyright © 2020 Wasko. All rights reserved.
//

import Foundation
import SwiftUI

struct DropDown : View {

    @EnvironmentObject var dataLoader: DataLoader
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var dismissFooter = false
    let radius = CGFloat(6)
    
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
                        }
                        Spacer()
                    }
                    VStack {
                        ForEach(self.dataLoader.footerData.title) { row in
                            DropDownRow(title: row)
                                .padding(.bottom, 10)
                        }
                        Spacer()
                        NavigationLink(destination: ChangeLanguageView()) {
                            Text(self.dataLoader.footerData.changeLanguage)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.primaryPink)
                                .frame(width: UIScreen.screenWidth * 0.56, height: UIScreen.screenHeight * 0.07)
                                
                                .overlay(
                                    RoundedRectangle(cornerRadius: self.radius)
                                        .stroke(Color.primaryPink)
                                    
                                )
                        }
                    }
                    .padding(UIScreen.screenWidth * 0.07)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color.primaryPink)
                    )
                }.padding(15)
                .background(Color.primaryBlue
                    .edgesIgnoringSafeArea(.all))
                    

        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }


}

struct DropDown_Previews: PreviewProvider {
    static var previews: some View {
        DropDown()
    }
}
