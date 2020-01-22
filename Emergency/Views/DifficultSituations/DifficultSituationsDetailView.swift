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
    
    var difficultSituation: DifficultSituations
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
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
                    Spacer()
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.primaryPink, lineWidth: 10)
                    .background(Color.primaryPink)
                    VStack {
                        Text(self.difficultSituation.title)
                            .font(.title)
                            .padding(.bottom, 15)
                        Text(self.difficultSituation.text)
                        .padding(15)
                    }
                }
            .padding(30)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.primaryBlue
            .edgesIgnoringSafeArea(.all)
        )
            .foregroundColor(.white)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct DifficultSituationsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultSituationsDetailView(difficultSituation: difficultSituationsData[0])
    }
}
