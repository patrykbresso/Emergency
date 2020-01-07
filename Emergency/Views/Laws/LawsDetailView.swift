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

    var law: Laws

    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        VStack {
                            Image("law")
                                .renderingMode(.original)
                            Image("left_arrow")
                                .renderingMode(.original)
                        }             
                    }
                ScrollView {
                    VStack {
                            Text(self.law.title)
                                .bold()
                            Spacer()
                            Text(self.law.text)
                    }
                    .padding(20)
                    .frame(width: geometry.size.width / 1.3)
                    .foregroundColor(.white)
                    .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                    .cornerRadius(10)
                }.padding(.bottom, 20)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255)
                .edgesIgnoringSafeArea(.all)
            )
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        
    }
}

struct LawsDetailView_Preview: PreviewProvider {
    static var previews: some View {
        LawsDetailView(law: lawsData[0])
    }
}


