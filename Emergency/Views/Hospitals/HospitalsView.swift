//
//  PoliceList.swift
//  Emergency
//
//  Created by Patryk Bresso on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//


import SwiftUI

struct HospitalsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var keyword: String = ""
    
    private let title = "Szpitalne Oddziały Ratunkowe SOR"
    private let subtitle = "we Wrocławiu czynne przez całą dobę. SOR udziela świadczeń zdrowotnych w stanach nagłych. Polegają one na wstępnej diagnostyce i leczeniu w zakresie niezbędnym do stabilizacji funkcji życiowych osób, które znajdują się w stanie zagrożenia życia lub zdrowia."
    var body: some View {
          
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255)
                .edgesIgnoringSafeArea(.all)
                VStack(spacing: 40) {
                    HStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            VStack {
                                Image("hospital")
                                    .renderingMode(.original)
                                Image("left_arrow")
                                    .renderingMode(.original)
                                
                            }
                        }
                        Spacer()
                    }.padding(.leading, 80)
                    ZStack() {
                        RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                        .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                        
                        VStack {
                            Text(self.title)
                                .bold()
                            Text(self.subtitle)
                        }
                        .multilineTextAlignment(.leading)
                        
                    }
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .frame(width: geometry.size.width / 1.3, height: geometry.size.height / 4.5)
                    ScrollView() {
                        Spacer(minLength: 30)
                        VStack(alignment: .center, spacing: 80) {
                            ForEach(hospitalsData) { hospital in
                                HospitalsRow(hospital: hospital)
                                }.padding(.leading, 40)
                        }.frame(width: geometry.size.width / 0.95, alignment: .center)
                    }.padding(.leading, geometry.size.width / 8)
                    //searchbar
                    HStack {
                        Image("magnifier")
                        .renderingMode(.original)
                        .padding(.leading, 80)
                        ZStack {
                            if(self.keyword.isEmpty) {
                                Text("szukaj...")
                            }
                            TextField("", text: self.$keyword)
                            .textFieldStyle(CustomTextFieldStyle())
                        }
                        .padding(.trailing, 40)
                        .foregroundColor(.white)
                    }
                }
            }
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }

}

struct HospitalsView_Previews: PreviewProvider {
    static var previews: some View {
        HospitalsView()
    }
}
