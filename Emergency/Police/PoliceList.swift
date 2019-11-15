//
//  PoliceList.swift
//  Emergency
//
//  Created by Patryk Bresso on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//


import SwiftUI

struct PoliceList: View {
    var body: some View {
        
        List(policeData) { policeStation in
            NavigationLink(destination: PoliceDetailView(policeStation: policeStation)) {
                PoliceRow(policeStation: policeStation)
            }
        }
    
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        PoliceList()
    }
}
