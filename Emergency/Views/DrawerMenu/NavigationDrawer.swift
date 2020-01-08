//
//  NavigationDrawer.swift
//  Emergency
//
//  Created by Patryk Bresso on 18/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import Foundation
import SwiftUI

struct NavigationDrawer: View {
    private let width = UIScreen.main.bounds.width - 200
    private let height = UIScreen.main.bounds.height - 700
    let isOpen: Bool
    
    var body: some View {
        GeometryReader { geometry in
            HStack() {
                VStack() {
                    DrawerContent()
                        .frame(width: !self.isOpen ? 0 : self.width, height: !self.isOpen ? 0 : self.height)
                        .offset(x: geometry.size.width - 220)
                        .animation(.default)
                        .background(Color.white)
                    Spacer()
                }
            }
        }
    }
}
