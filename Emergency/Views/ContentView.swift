//
//  ContentView.swift
//  Emergency
//
//  Created by Patryk Bresso on 11/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var keyword: String = ""
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(alignment: HorizontalAlignment.leading) {
                NavigationView {
                    VStack(alignment: .leading) {
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
                        }.padding(.top, 150)
                        HStack() {
                            NavigationLink(destination: TranslateView()) {
                                VStack {
                                    Image("translate")
                                        .renderingMode(.original)
                                    Text("TRANSLATE")
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                }.frame(width: geometry.size.width / 2 - 60)
                            }
                            Spacer()
                            NavigationLink(destination: PhoneNumbersView()) {
                                VStack {
                                    Image("phone")
                                        .renderingMode(.original)
                                    Text("PHONE NUMBERS")
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
                                    Text("HELP")
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                }.frame(width: geometry.size.width / 2 - 60)
                            }
                            Spacer()
                            NavigationLink(destination: LawsView()) {
                                VStack {
                                    Image("law")
                                        .renderingMode(.original)
                                    Text("LAWS")
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
                                    Text("DIFFICULT SITUATIONS")
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                }.frame(width: geometry.size.width / 2 - 60)
                                
                            }
                            Spacer()
                            NavigationLink(destination: ConsulatesView()) {
                                VStack {
                                    Image("consulate")
                                        .renderingMode(.original)
                                    Text("CONSULATES")
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
                                    Text("HOSPITALS")
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                }.frame(width: geometry.size.width / 2 - 60)
                            }
                            Spacer()
                            NavigationLink(destination: PoliceView()) {
                                VStack {
                                    Image("police")
                                        .renderingMode(.original)
                                    Text("POLICE")
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                }.frame(width: geometry.size.width / 2 - 60)
                            }
                        }
                        Spacer()
                        TextField("", text: self.$keyword)
                            .textFieldStyle(CustomTextFieldStyle())
                            .padding(.top, 20)
                            .padding(.bottom, 20)
                            .padding(.leading, 35)
                            .padding(.trailing, 35)
                        
                    }
                    .padding(.leading, 30)
                    .padding(.trailing, 30)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                    .background(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255))
                    .foregroundColor(.white)
                    .edgesIgnoringSafeArea(.all)
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
