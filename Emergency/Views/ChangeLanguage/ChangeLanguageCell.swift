//
//  ChangeLanguageCell.swift
//  Emergency
//
//  Created by Patryk Bresso on 18/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI
import CoreLocation



struct ChangeLanguageCell: View {

    var language: String
    var body: some View {
        
        GeometryReader { geometry in
            ZStack() {
                RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                
                Text(self.language)
                    .bold()
                    
                
            }
            .font(.system(size: 14))
            .frame(width: geometry.size.width / 1.3, height: geometry.size.height / 3)
            .foregroundColor(.white)
        }
    }
}

#if DEBUG
struct ChangeLanguageCell_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ChangeLanguageCell(language: "Polski")
            ChangeLanguageCell(language: "Angielski")
        }
        .previewLayout(.fixed(width: 300, height: 100))
    }
}
#endif
