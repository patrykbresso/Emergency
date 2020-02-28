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
        

        ZStack() {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.primaryPink, lineWidth: 10)
                .background(Color.primaryPink)
            
            Text(self.language)
                .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                
            
        }
        .frame(width: UIScreen.screenWidth / 2.8, height: UIScreen.screenHeight / 9)
        .foregroundColor(.white)
    
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
