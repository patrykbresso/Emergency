//
//  PhoneNumbersView.swift
//  Emergency
//
//  Created by stud on 17/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct PhoneNumbersView: View {
    @State private var keyword: String = ""
    @State var clicked: Int = 0
    @State var emergencyNumberDescription: String = "czynny 24/7"
    let height: CGFloat = 80
    let description: String = ""
    @State var offsets: [CGFloat] = [0, 0, 0, 0, 0, 0]
    @State var descriptions: [String] = ["", "", "", "", "", ""]
    @State var heights: [CGFloat] = [80, 80, 80, 80, 80, 80]
    
    
    var body: some View {
        VStack(alignment: .trailing, spacing: -70) {
            Spacer()
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    self.changeDescription(boxNo: 0)
                    self.changeHeight(boxNo: 0)
                    self.changeOffset(boxNo: 0)
                }) {
                    VStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                            .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                            .frame(width: 170, height: heights[0])
                            .offset(y: offsets[0])
                        
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
                        Text("\(descriptions[0])")
                            .foregroundColor(.white)
                            .offset(y: -90)
                    }
                }
            }
            HStack {
                Button(action: {
                    self.changeDescription(boxNo: 1)
                    self.changeHeight(boxNo: 1)
                    self.changeOffset(boxNo: 1)
                }) {
                    VStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                            .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                            .frame(width: 170, height: heights[1])
                            .offset(y: offsets[1])
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
                        Text("\(descriptions[1])")
                            .foregroundColor(.white)
                            .offset(y: -90)
                    }
                }
                Spacer()
            }
            HStack {
                Spacer()
                Button(action: {
                    self.changeDescription(boxNo: 2)
                    self.changeHeight(boxNo: 2)
                    self.changeOffset(boxNo: 2)
                }) {
                    VStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                            .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                            .frame(width: 170, height: heights[2])
                            .offset(y: offsets[2])
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
                        Text("\(descriptions[2])")
                            .foregroundColor(.white)
                            .offset(y: -90)
                        
                    }
                }
            }
            HStack {
                Button(action: {
                    self.changeDescription(boxNo: 3)
                    self.changeHeight(boxNo: 3)
                    self.changeOffset(boxNo: 3)
                }) {
                    VStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                            .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                            .frame(width: 170, height: heights[3])
                            .offset(y: offsets[3])
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
                        Text("\(descriptions[3])")
                            .foregroundColor(.white)
                            .offset(y: -90)
                    }
                }
                Spacer()
            }
            HStack {
                Spacer()
                Button(action: {
                    self.changeDescription(boxNo: 4)
                    self.changeHeight(boxNo: 4)
                    self.changeOffset(boxNo: 4)
                }) {
                    VStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                            .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                            .frame(width: 170, height: heights[4])
                            .offset(y: offsets[4])
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
                        Text("\(descriptions[4])")
                            .foregroundColor(.white)
                            .offset(y: -90)
                    }
                }
            }
            HStack {
                Button(action: {
                    self.changeDescription(boxNo: 5)
                    self.changeHeight(boxNo: 5)
                    self.changeOffset(boxNo: 5)
                }) {
                    VStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                            .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                            .frame(width: 170, height: heights[5])
                            .offset(y: offsets[5])
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
                        Text("\(descriptions[5])")
                            .foregroundColor(.white)
                            .offset(y: -90)
                    }
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
    
    func changeHeight(boxNo: Int) {
        self.heights[boxNo] = (self.heights[boxNo] == 80) ? 150 : 80
    }
    
    func changeDescription(boxNo: Int) {
        descriptions[boxNo] = (descriptions[boxNo] == "") ? self.emergencyNumberDescription : ""
    }
    
    func changeOffset(boxNo: Int) {
        offsets[boxNo] = (offsets[boxNo] == 70) ? 0 : 70
    }
}

#if DEBUG
struct PhoneNumbersView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumbersView()
    }
}
#endif
