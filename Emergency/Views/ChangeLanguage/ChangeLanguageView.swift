//
//  ChangeLanguageView.swift
//  Emergency
//
//  Created by Patryk Bresso on 18/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI
import UIKit
import Combine



struct ChangeLanguageView: View {
    
    @EnvironmentObject var dropDown : DropDownMenu
    @EnvironmentObject var dataLoader: DataLoader
    @State private var showContentView = false
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var launch: FirstLaunch

    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Image("translate")
                        .renderingMode(.original)
                        .padding(.leading, 40)
                    Spacer()
                }
                
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        UserDefaults.standard.set("polish", forKey: "language")
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        ChangeLanguageCell(language: "Polski")
                    }
                    Spacer()
                    Button(action: {
                        UserDefaults.standard.set("spanish", forKey: "language")
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        ChangeLanguageCell(language: "Español")
                    }
                    Spacer()
                }
                .padding(.bottom, UIScreen.screenHeight / 15)
                HStack {
                    Spacer()
                    Button(action: {
                        UserDefaults.standard.set("english", forKey: "language")
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        ChangeLanguageCell(language: "English")
                    }
                    Spacer()
                    Button(action: {
                        UserDefaults.standard.set("ukrainian", forKey: "language")
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        ChangeLanguageCell(language: "Україна")
                    }
                    Spacer()
                }
                .padding(.bottom, UIScreen.screenHeight / 15)
                Button(action: {
                    UserDefaults.standard.set("german", forKey: "language")
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    ChangeLanguageCell(language: "Deutsch")
                }.onDisappear {
                    UserDefaults.standard.set(true, forKey: "launchedBefore")
                    self.dataLoader.loadLanguage(language: UserDefaults.standard.string(forKey: "language") ?? "english")
                    self.dropDown.isDropDownMenuOpen = false
                }
                Spacer()
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.primaryBlue
        .edgesIgnoringSafeArea(.all))
            
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}
    
    
struct ChangeLanguageView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeLanguageView()
    }
}
