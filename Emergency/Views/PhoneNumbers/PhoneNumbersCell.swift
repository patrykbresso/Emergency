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
                .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
            VStack {
                Text(phoneNumber.name)
                Text(phoneNumber.number)
                    .font(.headline)
                    .fontWeight(.bold)
                if(showDescription) {
                    Text(phoneNumber.available)
                        .font(.body)
                        .lineLimit(nil)
                        .foregroundColor(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255))
                    Text(phoneNumber.description)
                        .font(.caption)
                        .lineLimit(nil)
                        .foregroundColor(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255))
                }
            }
                    
        }
        .foregroundColor(.white)
    }
}

struct PhoneNumbersCell_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumbersCell(phoneNumber: phoneNumbersData[0], showDescription: true)
    }
}
