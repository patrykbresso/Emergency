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
                        
                        HStack() {
                            Spacer()
                            NavigationLink(destination: DropDown()) {
                                Text("...")
                                    .foregroundColor(Color.primaryPink)
                                    .bold()
                            }
                        }.offset(x: -20)
                        
                        ScrollView(showsIndicators: false) {
                            HStack() {
                                NavigationLink(destination: PsychologyView()) {
                                    VStack {
                                        Image("psychology")
                                            .renderingMode(.original)
                                        Text(self.dataLoader.menuData.psychology.uppercased())
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
                                        Text(self.dataLoader.menuData.advice.uppercased())
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(2)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    .frame(width: geometry.size.width / 2 - 40)
                                    
                                }
                            }.padding(.vertical)
                            HStack() {
                                NavigationLink(destination: TranslateView()) {
                                    VStack {
                                        Image("translate")
                                            .renderingMode(.original)
                                        Text(self.dataLoader.menuData.translate.uppercased())
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
                                        Text(self.dataLoader.menuData.phone.uppercased())
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
                                        Text(self.dataLoader.menuData.help.uppercased())
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
                                        Text(self.dataLoader.menuData.law.uppercased())
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
                                        Text(self.dataLoader.menuData.difficultsituations.uppercased())
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(2)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }.frame(width: geometry.size.width / 2 - 40)
                                    
                                }
                                Spacer()
                                NavigationLink(destination: ConsulatesView()) {
                                    VStack {
                                        Image("konsulaty")
                                            .renderingMode(.original)
                                        Text(self.dataLoader.menuData.consulate.uppercased())
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
                                        Text(self.dataLoader.menuData.hospital.uppercased())
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
                                        Text(self.dataLoader.menuData.police.uppercased())
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
                
                    .foregroundColor(.white)
                    
                
                }
                .keyboardObserving()

                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)


        }            .background(Color.primaryBlue
            .edgesIgnoringSafeArea(.all))

        }
        
    }

    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
