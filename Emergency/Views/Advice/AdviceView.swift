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
    
    @State private var keyword: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: HorizontalAlignment.leading, spacing: 15) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        VStack {
                            Image("advice")
                                .renderingMode(.original)
                            Image("left_arrow")
                                .renderingMode(.original)
                            
                        }.padding(.leading, 15)
                    }
                    ScrollView {
                        ForEach(adviceData) { advice in
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                                .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                                
                                Text(advice.text).padding(15)
                            }
                            .padding(15)
                        }
                    }
                    TextField("WYSZUKAJ", text: self.$keyword)
                        .textFieldStyle(CustomTextFieldStyle())
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                        .padding(.leading, 35)
                        .padding(.trailing, 35)
                }
                .padding(15)
                .foregroundColor(.white)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255)
                .edgesIgnoringSafeArea(.all)
            )
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