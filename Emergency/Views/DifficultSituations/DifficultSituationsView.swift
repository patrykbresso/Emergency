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
    @EnvironmentObject var dataLoader: DataLoader
    @State var backButtonSize: CGRect = CGRect()
    let paddingSides = CGFloat(20)
    
    var body: some View {
        VStack(spacing: 8) {
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
                    Image("difficultsituations")
                        .renderingMode(.original)
                        .padding(.leading, -self.backButtonSize.width)
                    Spacer()
                    NavigationLink(destination: DropDown()) {
                        Text("...")
                            .foregroundColor(Color.primaryPink)
                            .bold()
                    }
                }.padding(15)
                ForEach(self.dataLoader.difficultSituationsData){ row in
                    if(row.id % 2 == 0) {
                        HStack {
                            NavigationLink(destination: DifficultSituationsDetailView(difficultSituation: row)) {
                                DifficultSituationsCell(difficultSituation: row)
                            }.frame(width: UIScreen.screenWidth / 2 - 2 * self.paddingSides)
                            Spacer()
                            }
                            .padding(.bottom, 10)
                    } else {
                        HStack {
                            Spacer()
                            NavigationLink(destination: DifficultSituationsDetailView(difficultSituation: row)) {
                                DifficultSituationsCell(difficultSituation: row)
                                    .frame(width: UIScreen.screenWidth / 2 - 2 * self.paddingSides)
                            }
                        }
                        .padding(.bottom, 10)
                    }
                }
            }
            .padding([.leading, .trailing, .bottom], self.paddingSides)
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
struct DifficultSituationsView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultSituationsView()
    }
}
#endif
