//
//  CustomTextFieldStyle.swift
//  Emergency
//
//  Created by Paulina Binas on 04/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {

    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .background(RoundedRectangle(cornerRadius: 5.0)
                .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 3)
            )
            .foregroundColor(.white)
    }
}
