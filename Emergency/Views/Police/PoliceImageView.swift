//
//  PolicaImageView.swift
//  Emergency
//
//  Created by Paulina Binas on 22/02/2020.
//  Copyright © 2020 Wasko. All rights reserved.
//

import SwiftUI

struct PoliceImageView: View {
    @EnvironmentObject var dataLoader: DataLoader
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var backButtonSize: CGRect = CGRect()
    let paddingSides = CGFloat(20)
    var image: String
    
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
                    Image("police")
                        .renderingMode(.original)
                        .padding(.leading, -self.backButtonSize.width)
                    Spacer()
                }
                Spacer()
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
        .padding([.leading, .trailing], self.paddingSides)
        .background(Color.primaryBlue
            .edgesIgnoringSafeArea(.all)
        )
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct PoliceImageView_Previews: PreviewProvider {
    static var previews: some View {
        PoliceImageView(image: "policja_soltysowicka")
    }
}
