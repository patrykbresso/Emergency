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
                    NavigationLink(destination: DropDown()) {
                        Text("...")
                            .foregroundColor(Color.primaryPink)
                            .font(Font.custom("ITCAvantGardePro-Bold", size: 18))
                    }
                }.padding(.bottom, 20)
                VStack {
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.onBoxClick(boxNo: 0)
                        }) {
                            PhoneNumbersCell(phoneNumber: self.dataLoader.phoneNumbersData[0], showDescription: self.boxClicked[0])
                                
                        }.frame(width: UIScreen.screenWidth / 1.5 - 2 * self.paddingSides)
                        
                        Spacer()
                    }.padding(.bottom, 30)
                    
                    ForEach((1..<(self.dataLoader.phoneNumbersData.count - 1)), id: \.self) { i in
                        HStack(spacing: 20) {
                            if(i % 2 == 1) {
                                
                                Button(action: {
                                    self.onBoxClick(boxNo: i)
                                }) {
                                    PhoneNumbersCell(phoneNumber: self.dataLoader.phoneNumbersData[i], showDescription: self.boxClicked[i])
                                        
                                }.frame(width: UIScreen.screenWidth / 2 - 2 * self.paddingSides)
                                
                                Button(action: {
                                    self.onBoxClick(boxNo: i + 1)
                                }) {
                                    PhoneNumbersCell(phoneNumber: self.dataLoader.phoneNumbersData[i+1], showDescription: self.boxClicked[i + 1])
                                        
                                }.frame(width: UIScreen.screenWidth / 2 - 2 * self.paddingSides)
                            }
                        }.padding(.bottom, 20)
                        
                    }
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            self.onBoxClick(boxNo: self.dataLoader.phoneNumbersData.count - 1)
                        }) {
                            PhoneNumbersCell(phoneNumber: self.dataLoader.phoneNumbersData[self.dataLoader.phoneNumbersData.count - 1], showDescription: self.boxClicked[self.dataLoader.phoneNumbersData.count - 1])
                                
                        }.frame(width: UIScreen.screenWidth / 1.5 - 2 * self.paddingSides)
                        
                        Spacer()
                    }.padding(.bottom, 20)
                }
            }
            .padding([.leading, .trailing], self.paddingSides)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color.primaryBlue
                .edgesIgnoringSafeArea(.all)
            )
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
    
    func callNumber(number: String) {
        let cleanString = String(number.filter { !" \n\t\r".contains($0) })
        let tel = "tel://"
        let formattedString = tel + cleanString
        let url: NSURL = URL(string: formattedString)! as NSURL
        UIApplication.shared.open(url as URL)
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
        if(self.boxClicked[boxNo]) {
            self.callNumber(number: self.dataLoader.phoneNumbersData[boxNo].number)
        }
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
