//
//  ContentView.swift
//  Emergency
//
//  Created by Patryk Bresso on 11/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //@State private var keyword: String = ""
    
    var body: some View {
        
        
        VStack(alignment: HorizontalAlignment.leading) {
            NavigationView {
                VStack(alignment: .leading) {
                    HStack() {
                        NavigationLink(destination: NewsView()) {
                            VStack {
                                Image("news")
                                    .renderingMode(.original)
                                Text("NEWSY")
                                .bold()
                            }
                        }
                        Spacer()
                        NavigationLink(destination: AdviceView()) {
                            VStack {
                                Image("advice")
                                    .renderingMode(.original)
                                Text("PORADY RÓŻNE")
                                    .bold()
                            }
                        }
                    }.padding(.top, 150)
                    HStack() {
                        NavigationLink(destination: TranslateView()) {
                            VStack {
                                Image("translate")
                                    .renderingMode(.original)
                                Text("TRANSLATE")
                                    .bold()
                            }
                        }
                        Spacer()
                        NavigationLink(destination: PhoneNumbersView()) {
                            VStack {
                                Image("phone")
                                    .renderingMode(.original)
                                Text("PHONE NUMBERS")
                                    .bold()
                            }
                        }
                    }
                    HStack() {
                        NavigationLink(destination: HelpView()) {
                            VStack {
                                Image("help")
                                    .renderingMode(.original)
                                Text("HELP")
                                    .bold()
                            }
                        }
                        Spacer()
                        NavigationLink(destination: LawsView()) {
                            VStack {
                                Image("law")
                                    .renderingMode(.original)
                                Text("LAWS")
                                    .bold()
                            }
                        }
                    }
                    HStack() {
                        NavigationLink(destination: DifficultSituationsView()) {
                            VStack {
                                Image("difficultsituations")
                                    .renderingMode(.original)
                                Text("DIFFICULT SITUATIONS")
                                    .bold()
                            }
                            
                        }
                        Spacer()
                        NavigationLink(destination: ConsulatesView()) {
                            VStack {
                                Image("consulate")
                                    .renderingMode(.original)
                                Text("CONSULATES")
                                    .bold()
                            }
                        }
                    }
                    HStack() {
                        NavigationLink(destination: HospitalsView()) {
                            VStack {
                                Image("hospital")
                                    .renderingMode(.original)
                                Text("HOSPITALS")
                                    .bold()
                            }
                        }
                        Spacer()
                        NavigationLink(destination: PoliceView()) {
                            VStack {
                                Image("police")
                                    .renderingMode(.original)
                                Text("POLICE")
                                    .bold()
                            }
                        }
                    }
                    
                }
                .padding(.leading, 50)
                .padding(.trailing, 50)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
                .background(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255))
                .foregroundColor(.white)
                .edgesIgnoringSafeArea(.all)
            }
            /*HStack() {
                TextField("WYSZUKAJ", text:$keyword)
                    .textFieldStyle(.roundedBorder)
            }*/
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
