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
    @State private var keyword: String = ""
    @State var searchResults: [Page] = []
    @EnvironmentObject var dataLoader: DataLoader
    @EnvironmentObject var dropDown : DropDownMenu
    @EnvironmentObject var launch: FirstLaunch
    @State private var alwaysTrue: Bool = true
    @State private var keyboardOpened = false
    @State private var menuSize: CGRect = CGRect()
    @State private var searchBarSize: CGRect = CGRect()
    @State private var spacingSize: CGFloat = 0
    var body: some View {
        NavigationView {
        GeometryReader { geometry in
                ZStack() {
                    
                    if !self.launch.firstLoad {
                        NavigationLink(destination: ChangeLanguageView(), isActive:  self.$alwaysTrue) {
                                              EmptyView()
                                      }
                    }
                    VStack(alignment: .leading) {
                        ScrollView(showsIndicators: false) {
                            HStack() {
                                NavigationLink(destination: NewsView()) {
                                    VStack {
                                        Image("news")
                                            .renderingMode(.original)
                                        Text(self.dataLoader.menuData.news)
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(2)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }.frame(width: geometry.size.width / 2 - 40)
                                }
                                Spacer()
                                NavigationLink(destination: AdviceView()) {
                                    VStack {
                                        Image("advice")
                                            .renderingMode(.original)
                                        Text(self.dataLoader.menuData.advice)
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.center)
                                            
                                            .lineLimit(2)
                                        .fixedSize(horizontal: false, vertical: true)
                                    }
                                    .frame(width: geometry.size.width / 2 - 40)
                                    
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
                                            
                                            .lineLimit(2)
                                        .fixedSize(horizontal: false, vertical: true)
                                    }.frame(width: geometry.size.width / 2 - 40)
                                }
                                Spacer()
                                NavigationLink(destination: PhoneNumbersView()) {
                                    VStack {
                                        Image("phone")
                                            .renderingMode(.original)
                                        Text(self.dataLoader.menuData.phone)
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(2)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }.frame(width: geometry.size.width / 2 - 40)
                                }
                            }.padding(.vertical)
                            HStack() {
                                NavigationLink(destination: HelpView()) {
                                    VStack {
                                        Image("help")
                                            .renderingMode(.original)
                                        Text(self.dataLoader.menuData.help)
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(3)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }.frame(width: geometry.size.width / 2 - 40)
                                }
                                Spacer()
                                NavigationLink(destination: LawsView()) {
                                    VStack {
                                        Image("law")
                                            .renderingMode(.original)
                                        Text(self.dataLoader.menuData.law)
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.center)
                                            
                                            
                                        .lineLimit(3)
                                        .fixedSize(horizontal: false, vertical: true)
                                    }.frame(width: geometry.size.width / 2 - 40)
                                }
                            }.padding(.vertical)
                            HStack() {
                                NavigationLink(destination: DifficultSituationsView()) {
                                    VStack {
                                        Image("difficultsituations")
                                            .renderingMode(.original)
                                        Text(self.dataLoader.menuData.difficultsituations)
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.center)
                                            
                                            .lineLimit(2)
                                        .fixedSize(horizontal: false, vertical: true)
                                    }.frame(width: geometry.size.width / 2 - 40)
                                    
                                }
                                Spacer()
                                NavigationLink(destination: ConsulatesView()) {
                                    VStack {
                                        Image("consulate")
                                            .renderingMode(.original)
                                        Text(self.dataLoader.menuData.consulate)
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.center)
                                            
                                            .lineLimit(2)
                                        .fixedSize(horizontal: false, vertical: true)
                                        
                                    }.frame(width: geometry.size.width / 2 - 40)
                                }
                            }.padding(.vertical)
                            HStack() {
                                NavigationLink(destination: HospitalsView()) {
                                    VStack {
                                        Image("hospital")
                                            .renderingMode(.original)
                                        Text(self.dataLoader.menuData.hospital)
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.center)
                                            
                                            .lineLimit(2)
                                        .fixedSize(horizontal: false, vertical: true)
                                    }.frame(width: geometry.size.width / 2 - 40)
                                }
                                Spacer()
                                NavigationLink(destination: PoliceView()) {
                                    VStack {
                                        Image("police")
                                            .renderingMode(.original)
                                        Text(self.dataLoader.menuData.police)
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.center)
                                            
                                            .lineLimit(2)
                                        .fixedSize(horizontal: false, vertical: true)
                                    }.frame(width: geometry.size.width / 2 - 40)
                                }
                            }
                            .padding(.vertical)
                        }
                        //search bar
                        HStack {
                            Image("magnifier")
                                .renderingMode(.original)
                            Spacer(minLength: 50)
                            ZStack {
                                
                                if(self.keyword.isEmpty) {
                                    Text(self.dataLoader.menuData.search)
                                }
                                TextField("", text: self.$keyword, onCommit: {
                                    self.keyboardOpened.toggle()
                                    if !self.keyword.trimmingCharacters(in: .whitespaces).isEmpty {
                                        let searchController: SearchController = SearchController(dataLoader: self.dataLoader)
                                        self.searchResults = searchController.searchByKeywords(searchedPhrase: self.keyword)
                                        
                                        self.show = true
                                    }
                                    self.keyword = ""
                                    }).padding(5)
                                    .onTapGesture {
                                    self.keyboardOpened.toggle()
                                }
                                .textFieldStyle(CustomTextFieldStyle())
                                
                            }
                        }.background(GeometryGetter(rect: self.$searchBarSize))
                            .padding(.bottom, 10)
                        //move view up when keyboard appears
                         
                        NavigationLink(destination: SearchResultsView(searchTerm: self.keyword, results: self.searchResults), isActive: self.$show, label: { EmptyView()})
                        
                    }
                    .padding([.leading, .trailing], 25)
                    .padding(.top, 20)
                
                    .foregroundColor(.white)
                    
                
                }
                .keyboardObserving()

                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .disabled(self.dropDown.isDropDownMenuOpen)
                .blur(radius: self.dropDown.isDropDownMenuOpen ? 4 : 0)
                HStack() {
                    Spacer()
                    DropDown()
                }.offset(x: -20)

        }            .background(Color.primaryBlue
            .edgesIgnoringSafeArea(.all))
            
        .onTapGesture {
                if self.dropDown.isDropDownMenuOpen {
                    self.dropDown.isDropDownMenuOpen.toggle()
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
