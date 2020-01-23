//
//  KeyboardGuardian.swift
//  Emergency
//
//  Created by Patryk Bresso on 23/01/2020.
//  Copyright © 2020 Wasko. All rights reserved.
//

import SwiftUI
import Combine

struct KeyboardObserving: ViewModifier {

  @State var keyboardHeight: CGFloat = 0
  @State var keyboardAnimationDuration: Double = 0

  func body(content: Content) -> some View {
    content
      .offset(y: -keyboardHeight)
      .edgesIgnoringSafeArea((keyboardHeight > 0) ? [.bottom] : [])
      .animation(.easeOut(duration: keyboardAnimationDuration))
      .onReceive(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
          .receive(on: RunLoop.main),
        perform: updateKeyboardHeight
      )
  }

  func updateKeyboardHeight(_ notification: Notification) {
    guard let info = notification.userInfo else { return }
    keyboardAnimationDuration = (info[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double) ?? 0.25

    guard let keyboardFrame = info[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
    if keyboardFrame.origin.y == UIScreen.main.bounds.height {
        keyboardHeight = 0
    } else {
        keyboardHeight = keyboardFrame.height - UIScreen.screenHeight * 0.04
    }
  }
}


