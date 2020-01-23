//
//  settings.swift
//  Emergency
//
//  Created by Patryk Bresso on 21/01/2020.
//  Copyright © 2020 Wasko. All rights reserved.
//

import Foundation
import SwiftUI

class FirstLaunch : ObservableObject {
    
    @Published var firstLoad: Bool = UserDefaults.standard.bool(forKey: "launchedBefore") 
}

