//
//  LawView.swift
//  Emergency
//
//  Created by stud on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct LawsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var dataLoader: DataLoader
    
    
    var body: some View {
        
        GeometryReader { geometry in
                VStack(spacing: 30) {
                    HStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            VStack {
                                Image("law")
                                    .renderingMode(.original)
                                Image("left_arrow")
                                    .renderingMode(.original)
                            }
                        }
                        Spacer()
                        NavigationLink(destination: LawsDetailView(law: self.dataLoader.lawsData[0])) {
                            LawsCell(law: self.dataLoader.lawsData[0])
                        }
                        .frame(width: geometry.size.width / 2.7, height: geometry.size.height / 9)
                    }
                    .padding(.trailing, 35)
                    .padding(.leading, 35)
                    ForEach((1...(self.dataLoader.lawsData.count - 1)), id: \.self) { i in
                        
                            HStack(spacing: 30) {
                                if(i % 2 == 1) {
                                    NavigationLink(destination: LawsDetailView(law: self.dataLoader.lawsData[i])) {
                                        LawsCell(law: self.dataLoader.lawsData[i])
                                        }.frame(width: geometry.size.width / 2.7)
                                    
                                    NavigationLink(destination: LawsDetailView(law: self.dataLoader.lawsData[i])) {
                                        LawsCell(law: self.dataLoader.lawsData[i + 1])
                                    }.frame(width: geometry.size.width / 2.7)
                                }
                            }
                    }
                    

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
struct LawsView_Previews: PreviewProvider {
    static var previews: some View {
        LawsView()
    }
}
#endif
