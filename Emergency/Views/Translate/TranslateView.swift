//
//  TranslateView.swift
//  Emergency
//
//  Created by stud on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct TranslateView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var dataLoader: DataLoader
    @State var buttonClicked: [Bool] = [false, false, false, false, false, false]
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
                    Image("translate")
                        .renderingMode(.original)
                        .padding(.leading, -self.backButtonSize.width)
                    Spacer()
                    NavigationLink(destination: DropDown()) {
                        Text("...")
                            .foregroundColor(Color.primaryPink)
                            .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                    }
                }.padding(.bottom, 15)
                
                
                VStack {
                    Spacer()
                    ForEach((0..<(self.dataLoader.translateData.count - 1)), id: \.self) { i in
                        HStack(spacing: 20) {
                            if(i % 2 == 0) {
                                Spacer()
                                Button(action: {
                                    self.onBoxClick(boxNo: i)
                                }) {
                                    TranslateCell(row: self.dataLoader.translateData[i], showTranslation: self.buttonClicked[i])
                                        .frame(width: UIScreen.screenWidth / 2 - 2 * self.paddingSides, height: UIScreen.screenHeight / 6)
                                }
                                Button(action: {
                                    self.onBoxClick(boxNo: i+1)
                                }) {
                                    TranslateCell(row: self.dataLoader.translateData[i+1], showTranslation: self.buttonClicked[i+1])
                                        .frame(width: UIScreen.screenWidth / 2 - 2 * self.paddingSides, height: UIScreen.screenHeight / 6)
                                }
                                Spacer()
                            }
                        }.padding(.bottom, 20)
                        
                    }
                    Spacer()
                }
                    
            }
            .padding([.leading, .trailing, .bottom], self.paddingSides)

        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.primaryBlue
            .edgesIgnoringSafeArea(.all)
        )
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func onBoxClick(boxNo: Int) {
        buttonClicked[boxNo] = buttonClicked[boxNo] ? false : true
    }
}

#if DEBUG
struct TranslateView_Previews: PreviewProvider {
    static var previews: some View {
        TranslateView()
    }
}
#endif
