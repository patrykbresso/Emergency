//
//  SearchResultsView.swift
//  Emergency
//
//  Created by Paulina Binas on 13/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct SearchResultsView: View {
    var searchTerm: String
    var results: [Page]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Rezultaty dla '" + self.searchTerm + "':").font(.title)
                if(self.results.count == 0) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                            .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                        Text("No results were found")
                    }.padding(15)
                } else {
                    ForEach(self.results) { result in
                        NavigationLink(destination: getDestination(pageName: result.name, pageNumber: result.page)) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                                    .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                                Text(result.name)
                            }
                        }.padding(15)
                    }
                }
            }
                .foregroundColor(.white)
                .padding(15)
                .padding(.top, 30)
        }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255))
            .edgesIgnoringSafeArea(.all)
    }
}

func getDestination(pageName: String, pageNumber: Int) -> AnyView {
    var police = AnyView(PoliceView())
    var advice = AnyView(AdviceView())
    var phone = AnyView(PhoneNumbersView())
    var translate = AnyView(TranslateView())
    var consulates = AnyView(ConsulatesView())
    var hospitals = AnyView(HospitalsView())
    var difficultSituations = AnyView(DifficultSituationsView())
    var law = AnyView(LawsView())
    var home = AnyView(ContentView())
    
    switch pageName {
        case "police": return police
        case "advice": return advice
        case "phoneNumbers": return phone
        case "translate": return translate
        case "consulates": return consulates
        case "hospitals": return hospitals
        case "difficultSituations": return difficultSituations
        case "laws": return law
        default: return home
    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView(searchTerm: "policja", results: [Page(id: 1, name: "name", page: 1), Page(id: 2, name: "name2", page: 1)])
    }
}
