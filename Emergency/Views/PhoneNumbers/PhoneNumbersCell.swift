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
                    .font(Font.custom("AvantGardeNormal", size: 14))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                Text(phoneNumber.number)
                    .fontWeight(.bold)
                    .font(Font.custom("AvantGardeBold", size: 14))
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(1)
                if(showDescription) {
                    Text(phoneNumber.available)
                        .fontWeight(.bold)
                        .font(Font.custom("AvantGardeBold", size: 14))
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(nil)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                    Text(phoneNumber.description)
                        .font(Font.custom("AvantGardeNormal", size: 14))
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
