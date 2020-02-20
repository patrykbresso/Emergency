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

    @EnvironmentObject var footer : FooterMenu
    @EnvironmentObject var dataLoader: DataLoader
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

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
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: self.radius)
                        .fill(Color.primaryPink)
                        VStack {
                            ForEach(self.dataLoader.footerData.title) { row in
                                DropDownRow(title: row)
                                    .padding(.bottom, 10)
                            }
                            Spacer()
                            NavigationLink(destination: ChangeLanguageView()) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: self.radius)
                                        .stroke(Color.white)
                                    Text(self.dataLoader.footerData.changeLanguage.uppercased())
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(Color.white)
                                }
                                .frame(height: 45.0)
                                
                            }
                        }.padding(.top, 15)
                    }.padding(UIScreen.screenWidth * 0.07)
                    Spacer()
                }.onAppear() {
                    if self.footer.closeFooter {
                        self.footer.closeFooter = false
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    
                }
                  
                .padding(15)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(Color.primaryBlue
                        .edgesIgnoringSafeArea(.all)
                    )
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
