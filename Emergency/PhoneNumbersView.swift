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
    @State var boxOffsets: [CGFloat] = [0, 0, 0, 0, 0, 0]
    @State var descriptions: [String] = ["", "", "", "", "", ""]
    @State var heights: [CGFloat] = [80, 80, 80, 80, 80, 80]
    @State var boxClicked: [Bool] = [false, false, false, false, false, false]
    
    
    var body: some View {
        VStack(alignment: .trailing, spacing: -70) {
            Spacer()
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    self.onBoxClick(boxNo: 0)
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
                    .offset(y: boxOffsets[0])
                }
            }
            HStack {
                Button(action: {
                    self.onBoxClick(boxNo: 1)
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
                    .offset(y: boxOffsets[1])
                }
                Spacer()
            }
            HStack {
                Spacer()
                Button(action: {
                    self.onBoxClick(boxNo: 2)
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
                    .offset(y: boxOffsets[2])
                }
            }
            HStack {
                Button(action: {
                    self.onBoxClick(boxNo: 3)
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
                    .offset(y: boxOffsets[3])
                }
                Spacer()
            }
            HStack {
                Spacer()
                Button(action: {
                    self.onBoxClick(boxNo: 4)
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
                    .offset(y: boxOffsets[4])
                }
            }
            HStack {
                Button(action: {
                    self.onBoxClick(boxNo: 5)
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
                    .offset(y: boxOffsets[5])
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
        if(boxNo != 0) {
            for n in 0...(boxNo - 1) {
                self.boxOffsets[n] = (self.boxOffsets[n] == 98.5) ? 0 : 98.5
            }
        }
    }
    
    func clearPreviousClick(boxNo: Int) {
        for n in 0...5 {
            if (n != boxNo && self.boxClicked[n]) {
                self.descriptions[n] = ""
                self.offsets[n] = 0
                self.boxOffsets = [0, 0, 0, 0, 0, 0]
                self.boxClicked[n] = false
                self.heights[n] = 80
            }
        }
    }
    
    func onBoxClick(boxNo: Int) {
        self.clearPreviousClick(boxNo: boxNo)
        self.changeHeight(boxNo: boxNo)
        self.changeDescription(boxNo: boxNo)
        self.changeOffset(boxNo: boxNo)
        self.boxClicked[boxNo] = self.boxClicked[boxNo] ? false : true
    }
}

#if DEBUG
struct PhoneNumbersView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumbersView()
    }
}
#endif
