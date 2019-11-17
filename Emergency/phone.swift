//
//  PhoneNumbersView.swift
//  Emergency
//
//  Created by stud on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct PhoneNumbersView: View {
    @State private var keyword: String = ""
    @State var clicked: Int = 0
    @State var description: String = ""
    @State var emergencyNumberDescription: String = "czynny 24/7"
    @State var showDetails = false
    @State var boxHeight: CGFloat = 80
    @State var offset: CGSize = 70
    
    var body: some View {
        VStack(alignment: .trailing, spacing: -70) {
            Spacer()
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    self.showDetails.toggle()
                    self.changeDescription()
                    self.changeHeight()
                    self.changeOffset()
                }) {
                    VStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                            .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                            .frame(width: 170, height: $boxHeight.value)
                            .offset(y: $offset.value)
                        
                        Text("Telefon Alarmowy")
                            .padding(.top, 15)
                            .padding(.leading, 5)
                            .padding(.trailing, 5)
                            .foregroundColor(.white)
                            .offset(y: -90)
                        Text("112")
                            .padding(.bottom, 15)
                            .padding(.leading, 5)
                            .padding(.trailing, 5)
                            .foregroundColor(.white)
                            .font(.title)
                            .offset(y: -90)
                        Text("\(description)")
                            .foregroundColor(.white)
                            .offset(y: -90)
                    }
                }
            }
            HStack {
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                        .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                        .frame(width: 170, height: 80)
                    Text("Pogotowie Ratunkowe")
                        .padding(.top, 15)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                        .foregroundColor(.white)
                        .offset(y: -90)
                    Text("999")
                        .padding(.bottom, 15)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                        .foregroundColor(.white)
                        .font(.title)
                        .offset(y: -90)
                }
                Spacer()
            }
            HStack {
                Spacer()
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                        .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                        .frame(width: 170, height: 80)
                    Text("Policja")
                        .padding(.top, 15)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                        .foregroundColor(.white)
                        .offset(y: -90)
                    Text("997")
                        .padding(.bottom, 15)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                        .foregroundColor(.white)
                        .font(.title)
                        .offset(y: -90)
                }
            }
            HStack {
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                        .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                        .frame(width: 170, height: 80)
                    Text("Straz pozarna")
                        .padding(.top, 15)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                        .foregroundColor(.white)
                        .offset(y: -90)
                    Text("998")
                        .padding(.bottom, 15)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                        .foregroundColor(.white)
                        .font(.title)
                        .offset(y: -90)
                }
                Spacer()
            }
            HStack {
                Spacer()
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                        .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                        .frame(width: 170, height: 80)
                    Text("Straz miejska")
                        .padding(.top, 15)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                        .foregroundColor(.white)
                        .offset(y: -90)
                    Text("986")
                        .padding(.bottom, 15)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                        .foregroundColor(.white)
                        .font(.title)
                        .offset(y: -90)
                }
            }
            HStack {
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                        .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                        .frame(width: 170, height: 80)
                    Text("Infolinia")
                        .padding(.top, 15)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                        .foregroundColor(.white)
                        .offset(y: -90)
                    Text("71 77 24 950")
                        .padding(.bottom, 15)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                        .foregroundColor(.white)
                        .font(.title)
                        .offset(y: -90)
                }
                Spacer()
            }
            TextField("WYSZUKAJ", text:$keyword)
                .foregroundColor(Color.white)
                .background(Color(red: 1.0, green: 0.0, blue: 0.0, opacity: 0))
        }
        .padding(20)
            .background(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255))
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .edgesIgnoringSafeArea(.all)
    }
    
    func changeHeight() {
        self.boxHeight = (self.boxHeight == 80) ? 150 : 80
    }
    
    func changeDescription() {
        self.description = self.emergencyNumberDescription
    }
    
    func changeOffset() {
        self.offset = (self.offset == 70) ? 0 : 70
    }
}

#if DEBUG
struct PhoneNumbersView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumbersView()
    }
}
#endif

