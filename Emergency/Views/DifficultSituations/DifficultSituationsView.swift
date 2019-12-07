//
//  DifficultSituationsView.swift
//  Emergency
//
//  Created by stud on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct DifficultSituationsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var keyword: String = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: HorizontalAlignment.leading) {
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    VStack {
                        Image("difficultsituations")
                            .renderingMode(.original)
                        Image("left_arrow")
                            .renderingMode(.original)
                        
                    }.padding(.leading, 15)
                }
                
                VStack {
                    ForEach(difficultSituationsData){ row in
                        if(row.id % 2 == 0) {
                            HStack {
                                NavigationLink(destination: DifficultSituationsDetailView(difficultSituation: row)) {
                                    DifficultSituationsCell(difficultSituation: row)
                                        .frame(width: 150, height: 60)
                                }
                                Spacer()
                                }
                                .padding(.bottom, 10)
                        } else {
                            HStack {
                                Spacer()
                                NavigationLink(destination: DifficultSituationsDetailView(difficultSituation: row)) {
                                    DifficultSituationsCell(difficultSituation: row)
                                        .frame(width: 150, height: 60)
                                }
                            }
                            .padding(.bottom, 10)
                        }
                    }
                }
                .padding(.leading, geometry.size.width / 10)
                .padding(.trailing, geometry.size.width / 10)
                TextField("WYSZUKAJ", text: self.$keyword)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding(.top, 20)
                    .padding(.bottom, 20)
                    .padding(.leading, 35)
                    .padding(.trailing, 35)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255)
            .edgesIgnoringSafeArea(.all)
        )
        .navigationBarBackButtonHidden(true)
    }
}

#if DEBUG
struct DifficultSituationsView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultSituationsView()
    }
}
#endif
