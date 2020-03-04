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
    @EnvironmentObject var footer : FooterMenu
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
                            Image("magnifier")
                                .renderingMode(.original)
                            Spacer()
                            ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.primaryPink, lineWidth: 3)
                                .frame(width: UIScreen.screenWidth - 120, height: 30)

                                if(self.keyword.isEmpty) {
                                    Text(self.dataLoader.menuData.search).font(.custom("ITCAvantGardePro-Bk", size: 14))
                                }
                                TextField("", text: self.$keyword, onCommit: {
                                    self.keyboardOpened = false
                                    if !self.keyword.trimmingCharacters(in: .whitespaces).isEmpty {
                                        let searchController: SearchController = SearchController(dataLoader: self.dataLoader)
                                        self.searchResults = searchController.searchByKeywords(searchedPhrase: self.keyword)
                                        
                                        self.show = true
                                    }
                                    self.keyword = ""
                                }).padding(20)
                                .onTapGesture {
                                    self.keyboardOpened = true
                                }
                                
                            }
                            Spacer()
                            NavigationLink(destination: DropDown()) {
                                Text("...").font(Font.custom("ITCAvantGardePro-Bold", size: 18))
                                    .foregroundColor(Color.primaryPink)
                            }.disabled(self.keyboardOpened)
                            .onTapGesture {
                                    if self.keyboardOpened {
                                        self.keyboardOpened.toggle()
                                    }
                            }
                        }.padding(.top, 5)
                        
                        ScrollView(showsIndicators: false) {
                            HStack() {
                                NavigationLink(destination: PsychologyView()) {
                                    VStack {
                                        Image("psychology")
                                            .renderingMode(.original)
                                        Text(self.dataLoader.menuData.psychology.uppercased())
                                            .font(.custom("ITCAvantGardePro-Bold", size: 14))
                                            .multilineTextAlignment(.center)
                                            .lineLimit(3)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }.frame(width: geometry.size.width / 2 - 25)
                                }
                                Spacer()
                                NavigationLink(destination: AdviceView()) {
                                    VStack {
                                        Image("advice")
                                            .renderingMode(.original)
                                        Text(self.dataLoader.menuData.advice.uppercased())
                                            .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(2)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }
                                    .frame(width: geometry.size.width / 2 - 25)
                                    
                                }
                            }.padding(.vertical)
                            HStack() {
                                NavigationLink(destination: TranslateView()) {
                                    VStack {
                                        Image("translate")
                                            .renderingMode(.original)
                                        Text(self.dataLoader.menuData.translate.uppercased())
                                            .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(2)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }.frame(width: geometry.size.width / 2 - 25)
                                }
                                Spacer()
                                NavigationLink(destination: PhoneNumbersView()) {
                                    VStack {
                                        Image("phone")
                                            .renderingMode(.original)
                                        Text(self.dataLoader.menuData.phone.uppercased())
                                            .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(2)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }.frame(width: geometry.size.width / 2 - 25)
                                }
                            }.padding(.vertical)
                            HStack() {
                                NavigationLink(destination: HelpView()) {
                                    VStack {
                                        Image("help")
                                            .renderingMode(.original)
                                        Text(self.dataLoader.menuData.help.uppercased())
                                            .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(3)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }.frame(width: geometry.size.width / 2 - 25)
                                }
                                Spacer()
                                NavigationLink(destination: LawsView()) {
                                    VStack {
                                        Image("law")
                                            .renderingMode(.original)
                                        Text(self.dataLoader.menuData.law.uppercased())
                                            .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(3)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }.frame(width: geometry.size.width / 2 - 25)
                                }
                            }.padding(.vertical)
                            HStack() {
                                NavigationLink(destination: DifficultSituationsView()) {
                                    VStack {
                                        Image("difficultsituations")
                                            .renderingMode(.original)
                                        Text(self.dataLoader.menuData.difficultsituations.uppercased())
                                            .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(2)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }.frame(width: geometry.size.width / 2 - 25)
                                    
                                }
                                Spacer()
                                NavigationLink(destination: ConsulatesView()) {
                                    VStack {
                                        Image("consulate")
                                            .renderingMode(.original)
                                        Text(self.dataLoader.menuData.consulate.uppercased())
                                            .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(2)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }.frame(width: geometry.size.width / 2 - 25)
                                }
                            }.padding(.vertical)
                            HStack() {
                                NavigationLink(destination: HospitalsView()) {
                                    VStack {
                                        Image("hospital")
                                            .renderingMode(.original)
                                        Text(self.dataLoader.menuData.hospital.uppercased())
                                            .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(2)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }.frame(width: geometry.size.width / 2 - 25)
                                }
                                Spacer()
                                NavigationLink(destination: PoliceView()) {
                                    VStack {
                                        Image("police")
                                            .renderingMode(.original)
                                        Text(self.dataLoader.menuData.police.uppercased())
                                            .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                                            .fontWeight(.bold)
                                            .multilineTextAlignment(.center)
                                            .lineLimit(2)
                                            .fixedSize(horizontal: false, vertical: true)
                                    }.frame(width: geometry.size.width / 2 - 25)
                                }
                            }
                            .padding(.vertical)
                        }.disabled(self.keyboardOpened)
                        .minimumScaleFactor(0.99)
                        .onTapGesture {
                                if self.keyboardOpened {
                                    self.keyboardOpened.toggle()
                                }
                        }
                            
                        /*.background(GeometryGetter(rect: self.$searchBarSize))
                            .padding(.bottom, 10)*/
                        //move view up when keyboard appears
                         
                        NavigationLink(destination: SearchResultsView(searchTerm: self.keyword, results: self.searchResults), isActive: self.$show, label: { EmptyView()})
                        
                    }
                    .padding([.leading, .trailing], 25)
                
                    .foregroundColor(.white)
                    
                
                }

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
