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
                        .padding(.top, 20)
                        .foregroundColor(.white)
                    
                    Spacer()
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
}

#if DEBUG
struct PsychologyView_Previews: PreviewProvider {
    static var previews: some View {
        PsychologyView()
    }
}
#endif
