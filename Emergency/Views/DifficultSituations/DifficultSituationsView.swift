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

    var body: some View {
        GeometryReader { geometry in
            VStack() {
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
                    Image("difficultsituations")
                        .renderingMode(.original)
                    Spacer()
                }.padding(15)
                VStack {
                    ForEach(self.dataLoader.difficultSituationsData){ row in
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

            }

        }
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
