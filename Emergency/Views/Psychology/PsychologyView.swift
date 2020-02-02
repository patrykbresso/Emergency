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

        
        GeometryReader { geometry in
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
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                        .fill(Color.primaryPink)
                        VStack {
                            Text(self.dataLoader.psychologyData.intro)
                                .padding(.bottom, 5)
                            .multilineTextAlignment(.center)
                            Text(self.dataLoader.psychologyData.name)
                                .bold()
                            .padding(.bottom, 5)
                            .multilineTextAlignment(.center)
                            Text(self.dataLoader.psychologyData.address)
                            .padding(.bottom, 5)
                            .multilineTextAlignment(.center)
                            Button(action: {

                                let http = "http://"
                                let formattedString = http + self.dataLoader.psychologyData.website
                                
                                let url: NSURL = URL(string: formattedString)! as NSURL

                                UIApplication.shared.open(url as URL)

                            }) {
                                Text(self.dataLoader.psychologyData.website)
                                .bold()
                                .padding(.bottom, 5)
                            }
                            Text(self.dataLoader.psychologyData.phoneInfo)
                                .bold()
                                .padding(.bottom, 5)
                            ForEach(self.listOFNumbers) { number in
                                Button(action: {
                                    let cleanString = String(number.name.filter { !" \n\t\r".contains($0) })
                                    let tel = "tel://"
                                    let formattedString = tel + cleanString
                                    let url: NSURL = URL(string: formattedString)! as NSURL
                                    UIApplication.shared.open(url as URL)
                                   }) {
                                    
                                
                                    Text(number.name)
                                    .bold()
                                    .padding(.bottom, 5)
                                }
                            }
                        }.padding(15)
                    }
                    Spacer(minLength: 25)
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                        .fill(Color.primaryPink)
                        
                        Text(self.dataLoader.psychologyData.text)
                            .multilineTextAlignment(.center)
                        .padding(5)
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
