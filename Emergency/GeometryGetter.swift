//
//  GeometryGetter.swift
//  Emergency
//
//  Created by Patryk Bresso on 24/01/2020.
//  Copyright © 2020 Wasko. All rights reserved.
//

import Foundation
import SwiftUI

struct GeometryGetter: View {
    @Binding var rect: CGRect

    var body: some View {
        return GeometryReader { geometry in
            self.makeView(geometry: geometry)
        }
    }

    func makeView(geometry: GeometryProxy) -> some View {
        DispatchQueue.main.async {
            self.rect = geometry.frame(in: .global)
        }
            
        

        return Rectangle().fill(Color.clear)
    }
}
