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
    @State var texts: [String] = ["emergency@pwr.edu.pl", "emergency@upwr.edu.pl"]
    @State var result: Result<MFMailComposeResult, Error>? = nil
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
                            .bold()
                    }
                }.padding(.bottom, 15)
                Spacer()
                
                ForEach(self.texts, id: \.self) { emailAddress in
                    Button(action: {
                        self.onBoxClick(boxNo: 0)
                    }) {
                        VStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.primaryPink, lineWidth: 10)
                                .background(Color.primaryPink)
                                .frame(width: 250, height: self.boxHeight)
                            Text(emailAddress)
                                .font(Font.custom("AvantGardeNormal", size: 14))
                                .padding(.top, 20)
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
                    .padding([.leading, .trailing], (geometry.size.width - 250) / 2)
                    .padding(.bottom, 20)
                
                }
                Spacer()

            }

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
