//
//  View.swift
//  Emergency
//
//  Created by Patryk Bresso on 23/01/2020.
//  Copyright © 2020 Wasko. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
  func keyboardObserving() -> some View {
    self.modifier(KeyboardObserving())
  }
}
