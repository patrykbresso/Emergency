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
    
    @EnvironmentObject var settings: UserSettings
    @State private var showContentView = false
    @Environment(\.presentationMode) var presentationMode
    

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
                    Button(action: {
                        self.settings.language = "polish"
                        
                        self.showContentView = true
                    }) {
                        ChangeLanguageCell(language: "POLSKI")
                    }
                    Spacer()
                    Button(action: {
                        self.settings.language = "spanish"
                        self.showContentView = true
                    }) {
                        ChangeLanguageCell(language: "Español")
                    }
                }
                HStack {
                    Button(action: {
                        self.settings.language = "english"
                        self.showContentView = true
                    }) {
                        ChangeLanguageCell(language: "ENGLISH")
                    }
                    Spacer()
                    Button(action: {
                        self.settings.language = "ukrainian"
                        self.showContentView = true
                    }) {
                        ChangeLanguageCell(language: "Україна")
                    }
                }
                Button(action: {
                    self.settings.language = "german"
                    self.showContentView = true
                }) {
                    ChangeLanguageCell(language: "DEUTSCH")
                }.onDisappear {
                    DataLoader(language: self.settings.language)
                   
                }
                
                NavigationLink(destination: ContentView(), isActive: self.$showContentView) { EmptyView() }
                
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255)
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
