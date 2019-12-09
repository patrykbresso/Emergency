
//
//  PoliceList.swift
//  Emergency
//
//  Created by Patryk Bresso on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//


import SwiftUI

struct PoliceView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var keyword: String = ""
    
    private let title = "POLICYJNE KONTAKTY I ADRESY"
    private let subtitle = "Uwaga! We wszystkich pilnych sprawach należy dzwonić na numer alarmowy 112"
    
    var body: some View {
           
        GeometryReader { geometry in
            VStack {
                HStack {
                    
                    //Back button
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        VStack {
                            Image("police")
                                .renderingMode(.original)
                            Image("left_arrow")
                                .renderingMode(.original)
                        }.padding(.leading, 20)
                    }
                    Spacer()
                    
                    //Map button
                    Button(action: {
                    }) {
                        Image("map")
                            .renderingMode(.original)
                    }.padding(.trailing, 20)
                }
                
                //Title cell
                ZStack() {
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                    .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                    
                    VStack {
                        Text(self.title)
                            .bold()
                        Text(self.subtitle)
                    }
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 14))
                }
                .foregroundColor(.white)
                .frame(width: geometry.size.width / 1.4, height: geometry.size.height / 9)
                
                
                //ScrollView with list of policestations
                ScrollView {
                    VStack(spacing: 80) {
                        
                        ForEach(policeData) { policeStation in
                                NavigationLink(destination: PoliceDetailView(policeStation: policeStation)) {
                                    PoliceRow(policeStation: policeStation)
                                    }
                        }.padding(.leading, 20)
                    }.frame(width: geometry.size.width / 1.1, alignment: .center)
                }.padding(.leading, geometry.size.width / 8)
                    .padding(.top, 20)
                
                //searchbar
                TextField("WYSZUKAJ", text: self.$keyword)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                    .padding(.leading, 35)
                    .padding(.trailing, 35)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255)
            .edgesIgnoringSafeArea(.all)
        )
        .navigationBarBackButtonHidden(true)
    }
}

struct PoliceView_Previews: PreviewProvider {
    static var previews: some View {
        PoliceView()
    }
}

