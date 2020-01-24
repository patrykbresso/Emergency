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
    @EnvironmentObject var dataLoader: DataLoader
    var consulate: Consulates
    var body: some View {
    

            ZStack() {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.primaryPink)
                VStack {
                    Text(self.consulate.name)
                        .bold()
                    Text(self.consulate.consulName).padding(.bottom, 10)
                    Text(self.consulate.address).padding(.bottom, 10)
                    Button(action: {
                        let cleanString = String(self.consulate.number.filter { !" \n\t\r".contains($0) })
                        let tel = "tel://"
                        let formattedString = tel + cleanString
                        let url: NSURL = URL(string: formattedString)! as NSURL
                        UIApplication.shared.open(url as URL)
                       }) {
                       Text(self.consulate.number)
                        .bold()
                    }
                }
            }
            .font(.system(size: 14))
            .frame(width: UIScreen.screenWidth / 1.3, height: UIScreen.screenHeight / 6)
            .foregroundColor(.white)
        
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
