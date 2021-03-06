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

class DataLoader: ObservableObject {

    @Published var policeData: PoliceList
    @Published var hospitalsData: HospitalsList
    @Published var consulatesData: [Consulates]
    @Published var lawsData: [Laws]
    @Published var difficultSituationsData: [DifficultSituations]
    @Published var adviceData: Advice
    @Published var phoneNumbersData: [PhoneNumber]
    @Published var translateData: [Translate]
    @Published var footerData: Footer
    @Published var searchKeywords: [SearchKeywords]
    @Published var menuData: Menu
    @Published var psychologyData: Psychology
    
    
   
    init(language: String) {
        hospitalsData = DataLoader.load("hospitalsData_\(language).json")
        policeData = DataLoader.load("policeData_\(language).json")
       
        consulatesData = DataLoader.load("consulatesData_\(language).json")
        lawsData = DataLoader.load("lawsData_\(language).json")
        difficultSituationsData = DataLoader.load("difficultSituationsData_\(language).json")
        adviceData = DataLoader.load("adviceData_\(language).json")
        phoneNumbersData = DataLoader.load("phoneNumbersData_\(language).json")
        translateData = DataLoader.load("translateData_\(language).json")
        footerData = DataLoader.load("footer_changelanguage_\(language).json")
        searchKeywords = DataLoader.load("searchKeywords_\(language).json")
        menuData = DataLoader.load("mainMenu_\(language).json")
        psychologyData = DataLoader.load("psychology_\(language).json")
    }
    
    func loadLanguage(language: String) {
        hospitalsData = DataLoader.load("hospitalsData_\(language).json")
        policeData = DataLoader.load("policeData_\(language).json")
       
        consulatesData = DataLoader.load("consulatesData_\(language).json")
        lawsData = DataLoader.load("lawsData_\(language).json")
        difficultSituationsData = DataLoader.load("difficultSituationsData_\(language).json")
        adviceData = DataLoader.load("adviceData_\(language).json")
        phoneNumbersData = DataLoader.load("phoneNumbersData_\(language).json")
        translateData = DataLoader.load("translateData_\(language).json")
        footerData = DataLoader.load("footer_changelanguage_\(language).json")
        searchKeywords = DataLoader.load("searchKeywords_\(language).json")
        menuData = DataLoader.load("mainMenu_\(language).json")
        psychologyData = DataLoader.load("psychology_\(language).json")
    }
    
static func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    
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



}


//For previews
var policeData: PoliceList = load("policeData.json")
var hospitalsData: HospitalsList = load("hospitalsData.json")
var consulatesData: [Consulates] = load("consulatesData.json")
var lawsData: [Laws] = load("lawsData.json")
var difficultSituationsData: [DifficultSituations] = load("difficultSituationsData.json")
var adviceData: Advice = load("adviceData.json")
var phoneNumbersData: [PhoneNumber] = load("phoneNumbersData.json")
var translateData: [Translate] = load("translateData.json")
var searchKeywords: [SearchKeywords] = load("searchKeywords.json")
var menuData: Menu = DataLoader.load("mainMenu.json")
var psychologyData: Psychology = DataLoader.load("psychology.json")

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
