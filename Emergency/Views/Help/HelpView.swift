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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var dataLoader: DataLoader
    @State var texts: [String] = ["emergency@pwr.edu.pl", "emergency@upwr.edu.pl", "emergency@awf.wroc.pl", "emergency@ue.wroc.pl", "emergency@asp.wroc.pl", "emergency@umed.wroc.pl"]
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var mail: String = ""
    @State var isShowingMailView = false
    @State var backButtonSize: CGRect = CGRect()
    let paddingSides = CGFloat(20)
    var boxHeight: CGFloat = 100
    
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
                            
                        }.background(GeometryGetter(rect: self.$backButtonSize))
                    }
                    Spacer()
                    Image("help")
                        .renderingMode(.original)
                        .padding(.leading, -self.backButtonSize.width)
                    Spacer()
                    NavigationLink(destination: DropDown()) {
                        Text("...")
                            .foregroundColor(Color.primaryPink)
                            .font(Font.custom("ITCAvantGardePro-Bold", size: 18))
                    }
                }.padding(.bottom, 20)
                .padding([.leading, .trailing], self.paddingSides)
                
                ScrollView {
                    ForEach(self.texts, id: \.self) { emailAddress in
                        Button(action: {
                            self.onBoxClick(boxNo: Int(self.texts.firstIndex(of: emailAddress) ?? 0))
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.primaryPink)
                                    .frame(width: 250, height: self.boxHeight)
                                Text(emailAddress)
                                    .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                                    .foregroundColor(.white)
                                    .frame(width: 250, height: self.boxHeight)
                                    
                            }
                        }.frame(width: 250, height: self.boxHeight)
                            .disabled(!MFMailComposeViewController.canSendMail())
                            .sheet(isPresented: self.$isShowingMailView) {
                                MailView(result: self.$result, mail: self.mail)
                            }
                        .padding([.leading, .trailing], (geometry.size.width - 250) / 2)
                        .padding(.bottom, 20)
                    
                    }
                    Spacer()
                }

            }

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
        self.mail = self.texts[boxNo]
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
