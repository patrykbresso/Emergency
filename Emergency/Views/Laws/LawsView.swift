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
    
    let rows = Row.read()
    
    
    var body: some View {
        
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                
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
                
                VStack(spacing: 40) {
                    ForEach(self.rows) { row in
                        HStack(spacing: 40) {
                            ForEach(row.cells) { cell in
                                NavigationLink(destination: LawsDetailView(law: cell)) {
                                    LawsCell(law: cell)
                                    }
                            }
                            .frame(width: geometry.size.width / 2.4)
                        }
                    }
                }
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
