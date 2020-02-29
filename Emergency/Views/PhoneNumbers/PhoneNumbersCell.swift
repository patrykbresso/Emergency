//
//  PhoneNumbersCell.swift
//  Emergency
//
//  Created by Paulina Binas on 08/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct PhoneNumbersCell: View {
    var phoneNumber: PhoneNumber
    var showDescription: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.primaryPink)
            VStack {
                Text(phoneNumber.name)
                    .font(Font.custom("ITCAvantGardePro-Bk", size: 14))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                Button(action: {
                    if(self.showDescription){
                        let cleanString = String(self.phoneNumber.number.filter { !" \n\t\r".contains($0) })
                        let tel = "tel://"
                        let formattedString = tel + cleanString
                        let url: NSURL = URL(string: formattedString)! as NSURL
                        UIApplication.shared.open(url as URL)
                    }
                   }) {
                    Text(phoneNumber.number)
                        .fontWeight(.bold)
                        .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(1)
                    }
                if(showDescription) {
                    Text(phoneNumber.available)
                        .fontWeight(.bold)
                        .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(nil)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                    Text(phoneNumber.description)
                        .font(Font.custom("ITCAvantGardePro-Bk", size: 14))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(nil)
                        .padding(.trailing, 5)
                }
            }
                .padding(.bottom, 5)
                .padding(.top, 5)
                    
        }
        .foregroundColor(.white)
    }
}

struct PhoneNumbersCell_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumbersCell(phoneNumber: phoneNumbersData[0], showDescription: true)
    }
}
