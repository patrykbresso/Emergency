//
//  HelpView.swift
//  Emergency
//
//  Created by stud on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI
import MessageUI

struct HelpView: View {
    @State private var keyword: String = ""
    @State var texts: [String] = ["emergency@pwr.edu"]
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    var boxHeight: CGFloat = 100
    
    
    var body: some View {
        VStack(spacing: 20) {
            HStack{
                Image("help")
                Spacer()
            }
            .padding(.top, 30)
            Spacer()
            Button(action: {
                self.onBoxClick(boxNo: 0)
            }) {
                VStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                        .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                        .frame(width: 250, height: boxHeight)
                    Text(texts[0])
                        .padding(.top, 15)
                        .foregroundColor(.white)
                        .frame(width: 250, height: boxHeight)
                        .offset(y: -120)
                }
            }.frame(width: 250, height: boxHeight)
                .offset(y: 55)
                .disabled(!MFMailComposeViewController.canSendMail())
                .sheet(isPresented: $isShowingMailView) {
                    MailView(result: self.$result)
                }
            Spacer()
            TextField("WYSZUKAJ", text:$keyword)
                .textFieldStyle(CustomTextFieldStyle())
                .padding(.top, 20)
                .padding(.bottom, 20)
                .padding(.leading, 35)
                .padding(.trailing, 35)
                
        }
        .padding(.leading, 35)
        .padding(.trailing, 35)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255))
        .foregroundColor(.white)
        .edgesIgnoringSafeArea(.all)
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
