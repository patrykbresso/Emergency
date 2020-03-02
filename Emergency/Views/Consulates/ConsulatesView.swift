
//
//  PoliceList.swift
//  Emergency
//
//  Created by Patryk Bresso on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//


import SwiftUI

struct ConsulatesView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var dataLoader: DataLoader
    @State var backButtonSize: CGRect = CGRect()
    @State var listOFNumbers = [Numbers]()
    let paddingSides = CGFloat(20)
    
    var body: some View {

            ZStack() {
                VStack() {
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
                        Image("consulate")
                            .renderingMode(.original)
                            .padding(.leading, -self.backButtonSize.width)
                        Spacer()
                        NavigationLink(destination: DropDown()) {
                            Text("...")
                                .foregroundColor(Color.primaryPink)
                                .font(Font.custom("ITCAvantGardePro-Bold", size: 18))
                        }
                    }.padding(.bottom, 20)
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .center, spacing: 30) {
                            ForEach(self.dataLoader.consulatesData) { consulate in
                                ConsulatesRow(consulate: consulate)
                            }
                        }
                    }
                    .frame(width: UIScreen.screenWidth / 1.3, alignment: .center)
                }
                .padding([.leading, .trailing], self.paddingSides)
        }
            .background(Color.primaryBlue
            .edgesIgnoringSafeArea(.all))
            
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

struct ConsulatesView_Previews: PreviewProvider {
    static var previews: some View {
        ConsulatesView()
    }
}

