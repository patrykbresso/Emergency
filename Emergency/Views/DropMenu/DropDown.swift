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

    @EnvironmentObject var dropDown : DropDownMenu
    @EnvironmentObject var dataLoader: DataLoader
    let radius = CGFloat(6)
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack() {
               Text("...")
            }.foregroundColor(Color.primaryPink)
                .onTapGesture {
                    self.dropDown.isDropDownMenuOpen.toggle()
                }
            if self.dropDown.isDropDownMenuOpen {
                VStack() {
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
                }.frame(width: self.dropDown.isDropDownMenuOpen ? UIScreen.screenWidth * 0.63 : 10, height: self.dropDown.isDropDownMenuOpen ? UIScreen.screenHeight * 0.63 : 10)
                    .padding(UIScreen.screenWidth * 0.07)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.primaryPink)
                )
            }
        }
        .background(Color.primaryBlue)
        
    }


}

struct DropDown_Previews: PreviewProvider {
    static var previews: some View {
        DropDown()
    }
}
