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
   
    var body: some View {
        VStack(alignment: .trailing) {
            HStack() {
               Text("...")
                }.foregroundColor(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                .onTapGesture {
                    self.dropDown.isDropDownMenuOpen.toggle()
                }
            if self.dropDown.isDropDownMenuOpen {
                VStack(alignment: .leading) {
                    NavigationLink(destination: ChangeLanguageView()) {
                            HStack {
                                Image("translate")
                                    .renderingMode(.original)
                                    .resizable()
                                    .frame(width: 35, height: 30)
                                    
                                Text("Language")
                                    .foregroundColor(Color.white)
                            }

                    }
                    HStack {
                        Image("group_of_people")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 55, height: 55)
                        Text("Stopka")
                            .foregroundColor(Color.white)
                    }
                    }.padding(5)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 2)
                    )
            }
        }.background(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255))
        
    }
}

class DropDownMenu : ObservableObject {
    @Published var isDropDownMenuOpen = false
}
