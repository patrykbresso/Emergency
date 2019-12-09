//
//  HelpView.swift
//  Emergency
//
//  Created by stud on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//


//Spacer()
//TextField("WYSZUKAJ", text: self.$keyword)
//    .textFieldStyle(CustomTextFieldStyle())
//    .padding(.top, 20)
//    .padding(.bottom, 20)
//    .padding(.leading, 35)
//    .padding(.trailing, 35)

import SwiftUI
import MessageUI

struct HelpView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var keyword: String = ""
    @State var texts: [String] = ["emergency@pwr.edu"]
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    var boxHeight: CGFloat = 100
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: HorizontalAlignment.leading) {
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    VStack {
                        Image("help")
                            .renderingMode(.original)
                        Image("left_arrow")
                            .renderingMode(.original)
                        
                    }.padding(.leading, 15)
                }
                Spacer()
                Button(action: {
                    self.onBoxClick(boxNo: 0)
                }) {
                    VStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                            .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                            .frame(width: 250, height: self.boxHeight)
                        Text(self.texts[0])
                            .padding(.top, 15)
                            .foregroundColor(.white)
                            .frame(width: 250, height: self.boxHeight)
                            .offset(y: -120)
                    }
                }.frame(width: 250, height: self.boxHeight)
                    .offset(y: 55)
                    .disabled(!MFMailComposeViewController.canSendMail())
                    .sheet(isPresented: self.$isShowingMailView) {
                        MailView(result: self.$result)
                    }
                    .padding(.trailing, (geometry.size.width - 250) / 2)
                    .padding(.leading, (geometry.size.width - 250) / 2)
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
        .navigationBarBackButtonHidden(true)
    }
    
    func onBoxClick(boxNo: Int) {
        self.isShowingMailView.toggle()
    }
}

#if DEBUG
struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
#endif
