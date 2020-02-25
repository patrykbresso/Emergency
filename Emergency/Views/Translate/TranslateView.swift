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
                            .bold()
                    }
                }.padding(.bottom, 15)
                ForEach(self.dataLoader.translateData) { row in
                    if(row.id % 2 == 0) {
                        HStack {
                            Button(action: {
                                self.onBoxClick(boxNo: row.id - 1)
                            }) {
                                TranslateCell(row: row, showTranslation: self.buttonClicked[row.id - 1])
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
                                TranslateCell(row: row, showTranslation: self.buttonClicked[row.id - 1])
                                .frame(width: 150)
                            }
                        }
                        .padding(.bottom, 5)
                    }
                }
                    
            }
            .padding([.leading, .trailing], self.paddingSides)

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
