//
//  NewsView.swift
//  Emergency
//
//  Created by stud on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct NewsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var keyword: String = ""
    
    var body: some View {
        GeometryReader { geometry in
                VStack(alignment: HorizontalAlignment.leading) {
                    
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        VStack {
                            Image("news")
                                .renderingMode(.original)
                            Image("left_arrow")
                                .renderingMode(.original)
                            
                        }.padding(.leading, 15)
                    }
                    Spacer()
                    HStack {
                        Image("magnifier")
                        .renderingMode(.original)
                        ZStack {
                            if(self.keyword.isEmpty) {
                                Text("szukaj...")
                            }
                            TextField("", text: self.$keyword)
                            .textFieldStyle(CustomTextFieldStyle())
                        }
                        .foregroundColor(.white)
                    }
                    .padding(.top, 20)
                    .padding(.leading, 35)
                    .padding(.trailing, 35)
                    .foregroundColor(.white)
                }
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

#if DEBUG
struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
#endif
