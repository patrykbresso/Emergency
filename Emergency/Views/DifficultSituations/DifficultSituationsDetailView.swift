//
//  DifficultSituationsDetailView.swift
//  Emergency
//
//  Created by Paulina Binas on 07/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//
import SwiftUI

struct DifficultSituationsDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var backButtonSize: CGRect = CGRect()
    let paddingSides = CGFloat(20)
    
    var difficultSituation: DifficultSituations
    
    var body: some View {
        VStack {
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
                        .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                }
            }.padding(.bottom, 20)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.primaryPink)
                VStack {
                    ScrollView(showsIndicators: false) {
                        Text(self.difficultSituation.title)
                            .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                            .lineSpacing(5.0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        Text(self.difficultSituation.text)
                            .font(Font.custom("ITCAvantGardePro-Bk", size: 14))
                            .lineSpacing(5.0)
                        HStack {
                            Button(action: {
                                self.callPhone(number: self.difficultSituation.phone)
                            }) {
                                self.difficultSituation.phone.map {
                                    Text($0)
                                        .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                                        .lineSpacing(5.0)
                                        .multilineTextAlignment(.leading)
                                }
                            }.padding([.bottom, .top], 5)
                            Spacer()
                        }
                        self.difficultSituation.text2.map {
                            Text($0)
                            .font(Font.custom("ITCAvantGardePro-Bk", size: 14))
                            .lineSpacing(5.0)
                        }
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
    
    func callPhone(number: String?) {
        if(number != nil) {
            let cleanString = String(number?.filter { !" \n\t\r".contains($0) } ?? "")
            let tel = "tel://"
            let formattedString = tel + cleanString
            let url: NSURL = URL(string: formattedString)! as NSURL
            UIApplication.shared.open(url as URL)
        }
    }
}



struct DifficultSituationsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultSituationsDetailView(difficultSituation: difficultSituationsData[0])
    }
}
