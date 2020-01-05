//
//  ContentView.swift
//  Emergency
//
//  Created by Patryk Bresso on 11/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var show: Bool = false
    @State var isDrawerOpen: Bool = false
    @State private var keyword: String = ""
    @State var searchResults: [Page] = []
    @EnvironmentObject var dataLoader: DataLoader
    
    var body: some View {
        NavigationView {
        GeometryReader { geometry in
            ZStack() {
            if !self.isDrawerOpen {
            VStack(alignment: HorizontalAlignment.leading) {
                    VStack(alignment: .leading, spacing: 30) {
                        Button(action: {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                self.isDrawerOpen.toggle()
                            }
                        }) {
                            Text("...")
                                .foregroundColor(.red)
                        }
                        HStack() {
                            NavigationLink(destination: NewsView()) {
                                VStack {
                                    Image("news")
                                        .renderingMode(.original)
                                    Text(self.dataLoader.menuData.news)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                }.frame(width: geometry.size.width / 2 - 60)
                            }
                            Spacer()
                            NavigationLink(destination: AdviceView()) {
                                VStack {
                                    Image("advice")
                                        .renderingMode(.original)
                                    Text(self.dataLoader.menuData.advice)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                }.frame(width: geometry.size.width / 2 - 60)
                            }
                        }
                        HStack() {
                            NavigationLink(destination: TranslateView()) {
                                VStack {
                                    Image("translate")
                                        .renderingMode(.original)
                                    Text(self.dataLoader.menuData.translate)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                }.frame(width: geometry.size.width / 2 - 60)
                            }
                            Spacer()
                            NavigationLink(destination: PhoneNumbersView()) {
                                VStack {
                                    Image("phone")
                                        .renderingMode(.original)
                                    Text(self.dataLoader.menuData.phone)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                }.frame(width: geometry.size.width / 2 - 60)
                            }
                        }
                        HStack() {
                            NavigationLink(destination: HelpView()) {
                                VStack {
                                    Image("help")
                                        .renderingMode(.original)
                                    Text(self.dataLoader.menuData.help)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                }.frame(width: geometry.size.width / 2 - 60)
                            }
                            Spacer()
                            NavigationLink(destination: LawsView()) {
                                VStack {
                                    Image("law")
                                        .renderingMode(.original)
                                    Text(self.dataLoader.menuData.law)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                }.frame(width: geometry.size.width / 2 - 60)
                            }
                        }
                        HStack() {
                            NavigationLink(destination: DifficultSituationsView()) {
                                VStack {
                                    Image("difficultsituations")
                                        .renderingMode(.original)
                                    Text(self.dataLoader.menuData.difficultsituations)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                }.frame(width: geometry.size.width / 2 - 60)
                                
                            }
                            Spacer()
                            NavigationLink(destination: ConsulatesView()) {
                                VStack {
                                    Image("consulate")
                                        .renderingMode(.original)
                                    Text(self.dataLoader.menuData.consulate)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                }.frame(width: geometry.size.width / 2 - 60)
                            }
                        }
                        HStack() {
                            NavigationLink(destination: HospitalsView()) {
                                VStack {
                                    Image("hospital")
                                        .renderingMode(.original)
                                    Text(self.dataLoader.menuData.hospital)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                }.frame(width: geometry.size.width / 2 - 60)
                            }
                            Spacer()
                            NavigationLink(destination: PoliceView()) {
                                VStack {
                                    Image("police")
                                        .renderingMode(.original)
                                    Text(self.dataLoader.menuData.police)
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                }.frame(width: geometry.size.width / 2 - 60)
                            }
                        }
                        HStack {
                            Image("magnifier")
                            .renderingMode(.original)
                            Spacer(minLength: 50)
                            ZStack {
                                
                                if(self.keyword.isEmpty) {
                                    Text("szukaj...")
                                }
                                TextField("", text: self.$keyword, onCommit: {
                                    let searchController: SearchController = SearchController(dataLoader: self.dataLoader)
                                    self.searchResults = searchController.searchByKeywords(searchedPhrase: self.keyword)
                                    self.show = true
                                })
                                .textFieldStyle(CustomTextFieldStyle())
                            }
                            .foregroundColor(.white)
                        }
                        .padding(.bottom, 20)
                        .padding(.leading, 35)
                        .padding(.trailing, 35)
                        .foregroundColor(.white)
                        NavigationLink(destination: SearchResultsView(searchTerm: self.keyword, results: self.searchResults), isActive: self.$show, label: { EmptyView()})
                    }
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                    .background(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255)
                        .edgesIgnoringSafeArea(.all))
                    .foregroundColor(.white)
                    
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            }
            //Check if its first launch of app
            
            }
            
            //Show drawer menu
            NavigationDrawer(isOpen: self.isDrawerOpen)
            }
           .onTapGesture {
               if self.isDrawerOpen {
                   self.isDrawerOpen.toggle()
               }
            }
            
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
