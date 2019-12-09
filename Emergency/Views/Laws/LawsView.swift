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
    @State private var keyword: String = ""
    
    let rows = Row.read()
    
    
    var body: some View {
        
        GeometryReader { geometry in
                
                
                VStack(spacing: 30) {
                    
                    HStack(spacing: 30) {

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
                        NavigationLink(destination: LawsDetailView(law: lawsData[0])) {
                        LawsCell(law: lawsData[0])
                        }
                        .frame(width: geometry.size.width / 2.7)
                    }
                    .padding(.trailing, 35)
                    .padding(.leading, 35)
                    
                    
                    ForEach(self.rows) { row in
                        HStack(spacing: 30) {
                            ForEach(row.cells) { cell in
                                NavigationLink(destination: LawsDetailView(law: cell)) {
                                    LawsCell(law: cell)
                                    }
                            }
                            .frame(width: geometry.size.width / 2.7)
                        }
                    }
                    
                    
                    TextField("WYSZUKAJ", text: self.$keyword)
                        .textFieldStyle(CustomTextFieldStyle())
                        .padding(.bottom, 10)
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
struct LawsView_Previews: PreviewProvider {
    static var previews: some View {
        LawsView()
    }
}
#endif
