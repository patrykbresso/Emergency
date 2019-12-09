//
//  DataLoader.swift
//  Emergency
//
//  Created by Patryk Bresso on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import UIKit
import SwiftUI
import CoreLocation


var policeData: [Police] = load("policeData.json")
var hospitalsData: [Hospitals] = load("hospitalsData.json")
var consulatesData: [Consulates] = load("consulatesData.json")
var lawsData: [Laws] = load("lawsData.json")
var difficultSituationsData: [DifficultSituations] = load("difficultSituationsData.json")
var adviceData: Advice = load("adviceData.json")
var phoneNumbersData: [PhoneNumber] = load("phoneNumbersData.json")
var translateData: [Translate] = load("translateData.json")

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


