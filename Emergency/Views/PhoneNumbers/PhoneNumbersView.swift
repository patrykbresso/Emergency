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
    @EnvironmentObject var dataLoader: DataLoader
    @State var boxClicked: [Bool] = [false, false, false, false, false, false]
    @State var backButtonSize: CGRect = CGRect()
    let paddingSides = CGFloat(20)
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: HorizontalAlignment.leading) {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        VStack {
                            Image("left_arrow")
                                .renderingMode(.original)
                            
                        }
                    }.background(GeometryGetter(rect: self.$backButtonSize))
                    Spacer()
                    Image("phone")
                        .renderingMode(.original)
                        .padding(.leading, -self.backButtonSize.width)
                    Spacer()
                }.padding(.bottom, 15)
                VStack {
                    ForEach(self.dataLoader.phoneNumbersData){ row in
                        if(row.id % 2 == 0) {
                            HStack {
                                Button(action: {
                                    self.onBoxClick(boxNo: row.id - 1)
                                }) {
                                    PhoneNumbersCell(phoneNumber: row, showDescription: self.boxClicked[row.id - 1])
                                        
                                }.frame(width: 155)
                                Spacer()
                                }
                        } else {
                            HStack {
                                Spacer()
                                Button(action: {
                                    self.onBoxClick(boxNo: row.id - 1)
                                }) {
                                    PhoneNumbersCell(phoneNumber: row, showDescription: self.boxClicked[row.id - 1])
                                    
                                }.frame(width: 155)
                            }
                            .padding(.bottom, 5)
                        }
                    }
                }
            }
            .padding([.leading, .trailing, .bottom], self.paddingSides)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.primaryBlue
                .edgesIgnoringSafeArea(.all)
            )
            .navigationBarTitle("")
            .navigationBarHidden(true)
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
