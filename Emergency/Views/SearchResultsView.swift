//
//  SearchResultsView.swift
//  Emergency
//
//  Created by Paulina Binas on 13/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct SearchResultsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var searchTerm: String
    var results: [Page]
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: HorizontalAlignment.leading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    VStack {
                        Image("magnifier")
                            .renderingMode(.original)
                        Image("left_arrow")
                            .renderingMode(.original)
                        
                    }.padding(.leading, 15)
                }
                Text("Rezultaty dla '" + self.searchTerm + "':").font(.title)
                if(self.results.count == 0) {
                    ScrollView{
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                            .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                            Text("No results were found").padding(15)
                        }.padding(15)
                    }
                } else {
                    ScrollView {
                        ForEach(self.results) { result in
                            NavigationLink(destination: getDestination(name: result.name, pageName: result.pageName, pageNumber: result.page)) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                                        .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                                    VStack {
                                        Text(result.pageName).fontWeight(.bold).padding(15)
                                        if(result.pageSubtitle != "") {
                                            Text(result.pageSubtitle)
                                                .font(.body).padding(.bottom, 15)
                                        }
                                    }
                                }
                            }.padding(15)
                        }
                    }
                }
            }
                .foregroundColor(.white)
                .padding(15)
                .padding(.top, 45)
        }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255))
            .edgesIgnoringSafeArea(.all)
    }
}

func getDestination(name: String, pageName: String, pageNumber: Int) -> AnyView {
    let police = AnyView(PoliceView())
    let advice = AnyView(AdviceView())
    let phone = AnyView(PhoneNumbersView())
    let translate = AnyView(TranslateView())
    let consulates = AnyView(ConsulatesView())
    let hospitals = AnyView(HospitalsView())
    let difficultSituations = AnyView(DifficultSituationsView())
    let law = AnyView(LawsView())
    let home = AnyView(ContentView())
    
    switch name {
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
        SearchResultsView(searchTerm: "policja", results: [Page(id: 1, name: "name", page: 1, pageName: "Numery", pageSubtitle: ""), Page(id: 2, name: "name2", page: 1, pageName: "Trudne Sytuacje", pageSubtitle: "Zbrodnia z nienawisci")])
    }
}
