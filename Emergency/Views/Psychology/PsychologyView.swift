//
//  NewsView.swift
//  Emergency
//
//  Created by stud on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct PsychologyView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var dataLoader: DataLoader
    @State var backButtonSize: CGRect = CGRect()
    @State var listOFNumbers = [Numbers]()
    let paddingSides = CGFloat(20)
        
        var body: some View {
                VStack(alignment: HorizontalAlignment.leading) {
                    
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
                        Image("psychology")
                            .renderingMode(.original)
                            .padding(.leading, -self.backButtonSize.width)
                        Spacer()
                    }
                        .foregroundColor(.white)
                    
                    Spacer(minLength: 25)
                    
                    ScrollView {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                            .fill(Color.primaryPink)
                            VStack {
                                HStack{
                                    Text(self.dataLoader.psychologyData.intro)
                                        .font(Font.custom("AvantGardeNormal", size: 14))
                                        .padding(.bottom, 5)
                                        .lineLimit(nil)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                }
                                HStack{
                                    Text(self.dataLoader.psychologyData.name)
                                        .font(Font.custom("AvantGardeBold", size: 14))
                                        .bold()
                                        .padding(.bottom, 5)
                                        .lineLimit(nil)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                }
                                HStack{
                                    Text(self.dataLoader.psychologyData.address)
                                        .font(Font.custom("AvantGardeNormal", size: 14))
                                        .padding(.bottom, 5)
                                        .lineLimit(nil)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                }
                                Button(action: {
                                    let http = "http://"
                                    let formattedString = http + self.dataLoader.psychologyData.website
                                    let url: NSURL = URL(string: formattedString)! as NSURL
                                    UIApplication.shared.open(url as URL)
                                }){
                                    HStack{
                                        Text(self.dataLoader.psychologyData.website)
                                            .font(Font.custom("AvantGardeBold", size: 14))
                                            .bold()
                                        Spacer()
                                    }
                                }.padding(.bottom, 5)
                                HStack{
                                    Text(self.dataLoader.psychologyData.phoneInfo)
                                        .font(Font.custom("AvantGardeBold", size: 14))
                                        .bold()
                                        .multilineTextAlignment(.leading)
                                        .lineLimit(2)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .padding(.bottom, 10)
                                    Spacer()
                                }
                                ForEach(self.listOFNumbers) { number in
                                    HStack{
                                        Button(action: {
                                            let cleanString = String(number.name.filter { !" \n\t\r".contains($0) })
                                            let tel = "tel://"
                                            let formattedString = tel + cleanString
                                            let url: NSURL = URL(string: formattedString)! as NSURL
                                            UIApplication.shared.open(url as URL)
                                           }) {
                                            Text(number.name)
                                            .font(Font.custom("AvantGardeBold", size: 14))
                                            .bold()
                                            .multilineTextAlignment(.leading)
                                        }
                                        Spacer()
                                    }
                                    .padding(.bottom, 5)
                                }
                            }.padding(15)
                        }
                        Spacer(minLength: 25)
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                            .fill(Color.primaryPink)
                            
                            Text(self.dataLoader.psychologyData.text)
                                .font(Font.custom("AvantGardeNormal", size: 14))
                                .multilineTextAlignment(.leading)
                                .lineLimit(nil)
                                .fixedSize(horizontal: false, vertical: true)
                            .padding(15)
                        }
                    }
                }.onAppear() {
                    self.listOFNumbers = self.dividePhoneNumbers(stringNumbers: self.dataLoader.psychologyData.numbers)
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
    
    
    func dividePhoneNumbers(stringNumbers: String) -> [Numbers]{
           var numbers = [Numbers]()
           let array = stringNumbers.components(separatedBy: ";")
           
           
           for i in array {
               let uuid = UUID()
               numbers.append(Numbers(id: uuid, name: i))
           }
       return numbers
       }
}

#if DEBUG
struct PsychologyView_Previews: PreviewProvider {
    static var previews: some View {
        PsychologyView()
    }
}
#endif
