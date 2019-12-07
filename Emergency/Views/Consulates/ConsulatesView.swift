
//
//  PoliceList.swift
//  Emergency
//
//  Created by Patryk Bresso on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//


import SwiftUI

struct ConsulatesView: View {
    
    var body: some View {
            
        ZStack(alignment: .top) {
            Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255)
            .edgesIgnoringSafeArea(.all)
            VStack(spacing: 40) {
                ForEach(consulatesData) { consulate in
                        NavigationLink(destination: ConsulatesDetailView(consulate: consulate)) {
                            ConsulatesRow(consulate: consulate)
                            }
                }
            }
        }
    }

}

struct ConsulatesView_Previews: PreviewProvider {
    static var previews: some View {
        ConsulatesView()
    }
}

