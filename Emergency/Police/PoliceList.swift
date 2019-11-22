
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
                        .frame(width: 340, height: 90)
                    }
        
            }
            .offset(y: 80)
            .padding(.top ,20)
            //.padding(.trailing, -32.0)
            .background(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255))
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .onAppear { UITableView.appearance().separatorStyle = .none
            UITableView.appearance().backgroundColor = UIColor.clear
                }
        }
    
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        PoliceList()
    }
}

extension Color {

    func uiColor() -> UIColor {

        let components = self.components()
        return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
    }

    private func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {

        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0

        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000ff) / 255
        }
        return (r, g, b, a)
    }
}
