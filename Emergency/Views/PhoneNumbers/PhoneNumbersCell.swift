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
                    .lineSpacing(5.0)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                    .padding(.bottom, 5)
                Text(phoneNumber.number)
                    .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                    .lineSpacing(5.0)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(1)
                    .padding(.bottom, 5)
                    
                if(showDescription) {
                    Text(phoneNumber.available)
                        .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                        .lineSpacing(5.0)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(nil)
                        .padding([.leading, .trailing, .bottom], 5)
                    if !phoneNumber.description.isEmpty {
                        Text(phoneNumber.description)
                            .font(Font.custom("ITCAvantGardePro-Bk", size: 14))
                            .lineSpacing(5.0)
                            .multilineTextAlignment(.center)
                            .fixedSize(horizontal: false, vertical: true)
                            .lineLimit(nil)
                            .padding(.trailing, 5)
                    }
                }
            }
                .padding(5)
                    
        }
        .foregroundColor(.white)
    }
}

struct PhoneNumbersCell_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumbersCell(phoneNumber: phoneNumbersData[0], showDescription: true)
    }
}
