//
//  PoliceView.swift
//  Emergency
//
//  Created by stud on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI
import CoreLocation



struct ConsulatesRow: View {

    var consulate: Consulates
    var body: some View {
        

            ZStack() {
                RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                
                VStack {
                    Text(consulate.name)
                        .bold()
                    Text(consulate.address)
                    Text(consulate.number)
                    Text(consulate.email)
                }
            }
            .foregroundColor(.white)
            .frame(width: 200, height: 80)
    }
}

#if DEBUG
struct ConsulatesRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ConsulatesRow(consulate: consulatesData[0])
            ConsulatesRow(consulate: consulatesData[0])
        }
        .previewLayout(.fixed(width: 300, height: 100))
    }
}
#endif
