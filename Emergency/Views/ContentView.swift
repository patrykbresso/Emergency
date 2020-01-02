//
//  ContentView.swift
//  Emergency
//
//  Created by Patryk Bresso on 11/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isDrawerOpen: Bool = false
    @State private var keyword: String = ""
    @State var show: Bool = false
    @State var searchResults: [Page] = []
    @EnvironmentObject var settings: UserSettings
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
                                    Text("NEWSY")
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                                }.frame(width: geometry.size.width / 2 - 60)
                            }
                            Spacer()
                            NavigationLink(destination: AdviceView()) {
                                VStack {
                                    Image("advice")
                                        .renderingMode(.original)
                                    Text("PORADY RÓŻNE")
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
                                    Text("TLUMACZENIE")
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                }.frame(width: geometry.size.width / 2 - 60)
                            }
                            Spacer()
                            NavigationLink(destination: PhoneNumbersView()) {
                                VStack {
                                    Image("phone")
                                        .renderingMode(.original)
                                    Text("NUMERY TELEFONOW")
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
                                    Text("POMOC")
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                }.frame(width: geometry.size.width / 2 - 60)
                            }
                            Spacer()
                            NavigationLink(destination: LawsView()) {
                                VStack {
                                    Image("law")
                                        .renderingMode(.original)
                                    Text("PRAWO")
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
                                    Text("TRUDNE SYTUACJE")
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                }.frame(width: geometry.size.width / 2 - 60)
                                
                            }
                            Spacer()
                            NavigationLink(destination: ConsulatesView()) {
                                VStack {
                                    Image("consulate")
                                        .renderingMode(.original)
                                    Text("KONSULATY")
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
                                    Text("SZPITALE")
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                }.frame(width: geometry.size.width / 2 - 60)
                            }
                            Spacer()
                            NavigationLink(destination: PoliceView()) {
                                VStack {
                                    Image("police")
                                        .renderingMode(.original)
                                    Text("POLICJA")
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
                                    self.searchResults = self.searchByKeywords(searchedPhrase: self.keyword)
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
            
            }
            NavigationDrawer(isOpen: self.isDrawerOpen)
            }
           .onTapGesture {
               if self.isDrawerOpen {
                   self.isDrawerOpen.toggle()
               }
        }.onAppear{
            print(self.settings.language)
            }
        }
    }

    func searchByKeywords(searchedPhrase: String) -> [Page] {
        var results: [Page] = []
        var i: Int = 1
        for view in dataLoader.searchKeywords {
            for word in view.keywords {
                if(searchedPhrase.lowercased().contains(word.keyword.lowercased())) {
                    let result: Page = Page(id: i,name: view.name, page: view.page, pageName: view.title, pageSubtitle: view.subtitle)
                    i = i + 1
                    results.append(result)
                }
            }
        }
        self.show = true
        return results
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
