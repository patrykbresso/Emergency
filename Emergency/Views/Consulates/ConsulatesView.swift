
//
//  PoliceList.swift
//  Emergency
//
//  Created by Patryk Bresso on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//


import SwiftUI

struct ConsulatesView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var keyword: String = ""
    
    var body: some View {
          
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255)
                .edgesIgnoringSafeArea(.all)
                VStack(spacing: 40) {
                    HStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            VStack {
                                Image("consulate")
                                    .renderingMode(.original)
                                Image("left_arrow")
                                    .renderingMode(.original)
                                
                            }
                        }
                        Spacer()
                    }.padding(.leading, 80)
                    
                    ScrollView() {
                        Spacer(minLength: 40)
                        VStack(alignment: .center, spacing: 100) {
                            ForEach(consulatesData) { consulate in
                                ConsulatesRow(consulate: consulate)
                                }.padding(.leading, 40)
                        }.frame(width: geometry.size.width / 0.95, alignment: .center)
                    }.padding(.leading, geometry.size.width / 8)
                    //searchbar
                    HStack {
                        Image("magnifier")
                        .renderingMode(.original)
                        .padding(.leading, 80)
                        ZStack {
                            if(self.keyword.isEmpty) {
                                Text("szukaj...")
                            }
                            TextField("", text: self.$keyword)
                            .textFieldStyle(CustomTextFieldStyle())
                        }
                        .padding(.trailing, 40)
                        .foregroundColor(.white)
                    }
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }

}

struct ConsulatesView_Previews: PreviewProvider {
    static var previews: some View {
        ConsulatesView()
    }
}

