//
//  settings.swift
//  Emergency
//
//  Created by Patryk Bresso on 21/01/2020.
//  Copyright © 2020 Wasko. All rights reserved.
//

import Foundation

class FirstLaunch : ObservableObject {
    
    @Published var firstLoad: Bool = UserDefaults.standard.bool(forKey: "launchedBefore") 
     

}

class DropDownMenu : ObservableObject {
    @Published var isDropDownMenuOpen = false
}
