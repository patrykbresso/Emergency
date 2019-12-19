//
//  DrawerContent.swift
//  Emergency
//
//  Created by Patryk Bresso on 18/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import Foundation
import SwiftUI

struct DrawerContent: View {
    var body: some View {
        NavigationLink(destination: ChangeLanguageView()) {
            Text("language")
        }
    }
}
