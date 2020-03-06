//
//  LawsDetailView.swift
//  Emergency
//
//  Created by Patryk Bresso on 04/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct LawsDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var backButtonSize: CGRect = CGRect()
    @EnvironmentObject var dataLoader: DataLoader
    let paddingSides = CGFloat(20)
    
    let index: Int
    //var law: Laws

    
    var body: some View {

            VStack() {
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
                    Image("law")
                        .renderingMode(.original)
                        .padding(.leading, -self.backButtonSize.width)
                    Spacer()
                    NavigationLink(destination: DropDown()) {
                        Text("...")
                            .foregroundColor(Color.primaryPink)
                            .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                    }
                }.padding(.bottom, 20)
                Spacer()
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.primaryPink)
                    VStack {
                        ScrollView(showsIndicators: false) {
                            Text(self.dataLoader.lawsData[index].title)
                                .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                                .lineSpacing(5.0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                
                            Spacer()
                            Text(self.dataLoader.lawsData[index].text)
                                .font(Font.custom("ITCAvantGardePro-Bk", size: 14))
                                .lineSpacing(5.0)
                        }.padding(10)
                    }
                        
                    .foregroundColor(.white)
                }
                Spacer(minLength: UIScreen.screenHeight / 10)
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
}

struct LawsDetailView_Preview: PreviewProvider {
    static var previews: some View {
        LawsDetailView(index: 1)
    }
}


