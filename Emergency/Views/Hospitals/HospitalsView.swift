
//
//  PoliceList.swift
//  Emergency
//
//  Created by Patryk Bresso on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//


import SwiftUI

struct HospitalsView: View {
    
    var body: some View {
            
        ZStack(alignment: .top) {
            Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255)
            .edgesIgnoringSafeArea(.all)
            VStack(spacing: 40) {
                
                ForEach(hospitalsData) { hospital in
                        NavigationLink(destination: HospitalsDetailView(hospital: hospital)) {
                            HospitalsRow(hospital: hospital)
                            }
                }
            }
        }
    }

}

struct HospitalsView_Previews: PreviewProvider {
    static var previews: some View {
        HospitalsView()
    }
}

