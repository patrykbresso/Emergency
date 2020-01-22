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
                .stroke(Color.primaryPink, lineWidth: 10)
                .background(Color.primaryPink)
            VStack {
                Text(phoneNumber.name)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
                Text(phoneNumber.number)
                    .font(.headline)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(nil)
                if(showDescription) {
                    Text(phoneNumber.available)
                        .font(.body)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(nil)
                        .padding(.leading, 5)
                        .padding(.trailing, 5)
                    Text(phoneNumber.description)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(nil)
                        .padding(.leading, 5)
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
