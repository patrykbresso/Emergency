//
//  AdviceView.swift
//  Emergency
//
//  Created by stud on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct AdviceView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var dataLoader: DataLoader
    @State var backButtonSize: CGRect = CGRect()
    let paddingSides = CGFloat(20)
    
    var body: some View {
            VStack(alignment: .leading) {
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
                    Image("advice")
                        .renderingMode(.original)
                        .padding(.leading, -self.backButtonSize.width)
                    Spacer()
                }
                ScrollView(showsIndicators: false) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.primaryPink)
                            
                             Text(self.dataLoader.adviceData.intro)
                                .font(Font.custom("AvantGardeNormal", size: 14))
                                .padding(10)
                            
                        }.fixedSize(horizontal: false, vertical: true)
                        ForEach(self.dataLoader.adviceData.advice) { advice in
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.primaryPink)
                                
                                Text(advice.text)
                                    .font(Font.custom("AvantGardeNormal", size: 14))
                                    .padding(10)
                                    .lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }.padding([.top, .bottom], 15)
                    }

            }
            .padding([.leading, .trailing], self.paddingSides)
            .foregroundColor(.white)
        
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
struct AdviceView_Previews: PreviewProvider {
    static var previews: some View {
        AdviceView()
    }
}
#endif
