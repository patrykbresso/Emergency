//
//  DifficultSituationsView.swift
//  Emergency
//
//  Created by stud on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct DifficultSituationsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var dataLoader: DataLoader
    @State var backButtonSize: CGRect = CGRect()
    let paddingSides = CGFloat(20)
    
    var body: some View {
        VStack(spacing: 10) {
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
                    Image("difficultsituations")
                        .renderingMode(.original)
                        .padding(.leading, -self.backButtonSize.width)
                    Spacer()
                    NavigationLink(destination: DropDown()) {
                        Text("...")
                            .foregroundColor(Color.primaryPink)
                            .font(Font.custom("ITCAvantGardePro-Bold", size: 18))
                    }
                }.padding(.bottom, 20)
            
                ForEach((0...(self.dataLoader.difficultSituationsData.count - 2)), id: \.self) { i in
                    
                    HStack(spacing: 20) {
                            if(i % 2 == 0) {
                                NavigationLink(destination: DifficultSituationsDetailView(difficultSituation: self.dataLoader.difficultSituationsData[i])) {
                                    DifficultSituationsCell(difficultSituation: self.dataLoader.difficultSituationsData[i])
                                }.frame(width: UIScreen.screenWidth / 1.9 - 2 * self.paddingSides)
                                
                                NavigationLink(destination: DifficultSituationsDetailView(difficultSituation: self.dataLoader.difficultSituationsData[i + 1])) {
                                    DifficultSituationsCell(difficultSituation: self.dataLoader.difficultSituationsData[i + 1])
                                }.frame(width: UIScreen.screenWidth / 1.9 - 2 * self.paddingSides)
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

#if DEBUG
struct DifficultSituationsView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultSituationsView()
    }
}
#endif
