//
//  TranslateView.swift
//  Emergency
//
//  Created by stud on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct TranslateView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var boxHeight: CGFloat = 100;
    @State private var keyword: String = ""
    @State var originalTexts: [String] = ["I need help!", "I need a doctor!", "Please take me to a hospital!", "Please call the police!", "I've been robbed!", "I'm on the (...) street."]
    @State var translations: [String] = ["Potrzebuje pomocy!", "Potrzebuje lekarza!", "Prosze zabierz mnie do szpitala!", "Prosze zadzwonic na policje!", "Zostalem okradziony!", "Jestem teraz na (...) ulicy."]
    @State var texts: [String] = ["I need help!", "I need a doctor!", "Please take me to a hospital!", "Please call the police!", "I've been robbed!", "I'm on the (...) street."]
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: HorizontalAlignment.leading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    VStack {
                        Image("advice")
                            .renderingMode(.original)
                        Image("left_arrow")
                            .renderingMode(.original)
                        
                    }.padding(.leading, 15)
                }
                .padding(.top, 40)
                HStack {
                    Spacer()
                    Button(action: {
                        self.onBoxClick(boxNo: 0)
                    }) {
                        VStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                                .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                                .frame(width: 150, height: self.boxHeight)
                            
                            Text(self.texts[0])
                                .padding(.top, 15)
                                .padding(.leading, 5)
                                .padding(.trailing, 5)
                                .foregroundColor(.white)
                                .frame(width: 150, height: self.boxHeight)
                                .offset(y: -120)
                        }
                    }.frame(width: 150, height: self.boxHeight)
                        .offset(y: 55)
                }
                HStack {
                    Button(action: {
                        self.onBoxClick(boxNo: 1)
                    }) {
                        VStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                                .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                                .frame(width: 150, height: self.boxHeight)
                            Text(self.texts[1])
                                .padding(.top, 15)
                                .padding(.leading, 5)
                                .padding(.trailing, 5)
                                .foregroundColor(.white)
                                .frame(width: 150, height: self.boxHeight)
                                .offset(y: -120)
                        }
                    }.frame(width: 150, height: self.boxHeight)
                    .offset(y: 55)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Button(action: {
                        self.onBoxClick(boxNo: 2)
                    }) {
                        VStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                                .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                                .frame(width: 150, height: self.boxHeight)
                            Text(self.texts[2])
                                .padding(.top, 15)
                                .padding(.leading, 5)
                                .padding(.trailing, 5)
                                .foregroundColor(.white)
                                .frame(width: 150, height: self.boxHeight)
                                .offset(y: -120)
                            
                        }
                    }.frame(width: 150, height: self.boxHeight)
                    .offset(y: 55)
                }
                HStack {
                    Button(action: {
                        self.onBoxClick(boxNo: 3)
                    }) {
                        VStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                                .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                                .frame(width: 150, height: self.boxHeight)
                            Text(self.texts[3])
                                .padding(.top, 15)
                                .padding(.leading, 5)
                                .padding(.trailing, 5)
                                .foregroundColor(.white)
                                .frame(width: 150, height: self.boxHeight)
                                .offset(y: -120)
                        }
                    }.frame(width: 150, height: self.boxHeight)
                    .offset(y: 55)
                    Spacer()
                }
                HStack {
                    Spacer()
                    Button(action: {
                        self.onBoxClick(boxNo: 4)
                    }) {
                        VStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                                .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                                .frame(width: 150, height: self.boxHeight)
                            Text(self.texts[4])
                                .padding(.top, 15)
                                .padding(.leading, 5)
                                .padding(.trailing, 5)
                                .foregroundColor(.white)
                                .frame(width: 150, height: self.boxHeight)
                                .offset(y: -120)
                        }
                    }.frame(width: 150, height: self.boxHeight)
                    .offset(y: 55)
                }
                HStack {
                    Button(action: {
                        self.onBoxClick(boxNo: 5)
                    }) {
                        VStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                                .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                                .frame(width: 150, height: self.boxHeight)
                            Text(self.texts[5])
                                .padding(.top, 15)
                                .padding(.leading, 5)
                                .padding(.trailing, 5)
                                .foregroundColor(.white)
                                .frame(width: 150, height: self.boxHeight)
                                .offset(y: -120)
                        }
                    }.frame(width: 150, height: self.boxHeight)
                    .offset(y: 55)
                    Spacer()
                }
                TextField("WYSZUKAJ", text:self.$keyword)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    .padding(.leading, 35)
                    .padding(.trailing, 35)
                    
            }
            .padding(.leading, 35)
            .padding(.trailing, 35)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        .background(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255))
        .foregroundColor(.white)
        .edgesIgnoringSafeArea(.all)
        //.navigationBarBackButtonHidden(true)
    }
    
    func onBoxClick(boxNo: Int) {
        if(texts[boxNo] == originalTexts[boxNo]) {
            texts[boxNo] = translations[boxNo]
        } else {
            texts[boxNo] = originalTexts[boxNo]
        }
    }
}

#if DEBUG
struct TranslateView_Previews: PreviewProvider {
    static var previews: some View {
        TranslateView()
    }
}
#endif
