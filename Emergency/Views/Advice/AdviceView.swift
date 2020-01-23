//
//  AdviceView.swift
//  Emergency
//
//  Created by stud on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct AdviceView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var dataLoader: DataLoader

    
    var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        VStack {
                            Image("left_arrow")
                                .renderingMode(.original)
                        }
                    }
                    Spacer()
                    Image("advice")
                        .renderingMode(.original)
                    Spacer()
                }.padding(.bottom, 15)
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.primaryPink, lineWidth: 10)
                            .background(Color.primaryPink)
                        
                         Text(self.dataLoader.adviceData.intro).padding(15)
                        
                    }.fixedSize(horizontal: false, vertical: true)
                    ScrollView {
                        ForEach(self.dataLoader.adviceData.advice) { advice in
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.primaryPink, lineWidth: 10)
                                .background(Color.primaryPink)
                                
                                Text(advice.text).padding(15).lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .padding(15)
                        }
                    }

            }
            .padding(15)
            .foregroundColor(.white)
        
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.primaryBlue
            .edgesIgnoringSafeArea(.all)
        )
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#if DEBUG
struct AdviceView_Previews: PreviewProvider {
    static var previews: some View {
        AdviceView()
    }
}
#endif
