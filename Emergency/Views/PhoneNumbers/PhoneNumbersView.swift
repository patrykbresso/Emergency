//
//  PhoneNumbersView.swift
//  Emergency
//
//  Created by stud on 17/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct PhoneNumbersView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var keyword: String = ""
    @State var boxClicked: [Bool] = [false, false, false, false, false, false]
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: HorizontalAlignment.leading) {
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    VStack {
                        Image("phone")
                            .renderingMode(.original)
                        Image("left_arrow")
                            .renderingMode(.original)
                        
                    }.padding(.leading, 15)
                }
                
                VStack {
                    ForEach(phoneNumbersData){ row in
                        if(row.id % 2 == 0) {
                            HStack {
                                Button(action: {
                                    self.onBoxClick(boxNo: row.id - 1)
                                }) {
                                    PhoneNumbersCell(phoneNumber: row, showDescription: self.boxClicked[row.id - 1])
                                        .frame(width: 150)
                                }
                                Spacer()
                                }
                                .padding(.bottom, 5)
                        } else {
                            HStack {
                                Spacer()
                                Button(action: {
                                    self.onBoxClick(boxNo: row.id - 1)
                                }) {
                                    PhoneNumbersCell(phoneNumber: row, showDescription: self.boxClicked[row.id - 1])
                                    .frame(width: 150)
                                }
                            }
                            .padding(.bottom, 5)
                        }
                    }
                }
                .padding(.leading, geometry.size.width / 10)
                .padding(.trailing, geometry.size.width / 10)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                TextField("", text: self.$keyword)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding(.top, 20)
                    .padding(.leading, 35)
                    .padding(.trailing, 35)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255)
                .edgesIgnoringSafeArea(.all)
            )
            .navigationBarBackButtonHidden(true)
        }
    }
    
    func clearPreviousClick(boxNo: Int) {
        for n in 0...5 {
            if (n != boxNo && self.boxClicked[n]) {
                self.boxClicked[n] = false
            }
        }
    }
    
    func onBoxClick(boxNo: Int) {
        self.clearPreviousClick(boxNo: boxNo)
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
