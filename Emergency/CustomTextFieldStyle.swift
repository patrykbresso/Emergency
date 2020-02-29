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
                .stroke(Color.primaryPink, lineWidth: 3)
                .frame(width: UIScreen.screenWidth - 120, height: 30)
                .padding(.top, 5)
            )
            .foregroundColor(.white)
    }
}
