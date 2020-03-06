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
    @EnvironmentObject var dataLoader: DataLoader
    @State var backButtonSize: CGRect = CGRect()
    let paddingSides = CGFloat(20)
    
    var searchTerm: String
    var results: [Page]
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: HorizontalAlignment.leading) {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                            Image("left_arrow")
                                .renderingMode(.original)
                    }.background(GeometryGetter(rect: self.$backButtonSize))
                    Spacer()
                    Image("magnifier")
                        .resizable()
                        .frame(width: 50.0, height: 50.0)
                        .padding(.leading, -self.backButtonSize.width)
                    Spacer()
                }.padding(.bottom, 30)
                if(self.results.count == 0) {
                    ScrollView(showsIndicators: false){
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.primaryPink, lineWidth: 10)
                                .background(Color.primaryPink)
                            Text("No results were found").padding(15)
                            .font(Font.custom("ITCAvantGardePro-Bk", size: 14))
                        }.padding(15)
                    }
                } else {
                    ScrollView(showsIndicators: false) {
                        ForEach(self.results) { result in
                            NavigationLink(destination: self.getDestination(name: result.name, pageName: result.pageName, pageNumber: result.page)) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.primaryPink, lineWidth: 10)
                                        .background(Color.primaryPink)
                                    VStack {
                                        Text(result.pageName).font(Font.custom("ITCAvantGardePro-Bold", size: 14)).frame(maxWidth: .infinity, alignment: .leading).padding(15)
                                        if(result.pageSubtitle != "") {
                                            Text(result.pageSubtitle)
                                                .font(Font.custom("ITCAvantGardePro-Bk", size: 14)).frame(maxWidth: .infinity, alignment: .leading).padding(15).padding(.top, 0)
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
            .background(Color.primaryBlue)
            .edgesIgnoringSafeArea(.all)
    }
    
    func getDestination(name: String, pageName: String, pageNumber: Int) -> AnyView {
        let police = AnyView(PoliceView())
        let advice = AnyView(AdviceView())
        let phone = AnyView(PhoneNumbersView())
        let translate = AnyView(TranslateView())
        let consulates = AnyView(ConsulatesView())
        let hospitals = AnyView(HospitalsView())
        let psychology = AnyView(PsychologyView())
        if(name == "difficultSituations") {
            return AnyView(DifficultSituationsDetailView(index: pageNumber - 1))
        }
        if(name == "laws") {
            return AnyView(LawsDetailView(index: pageNumber))
        }
        let home = AnyView(ContentView())
        
        switch name {
            case "police": return police
            case "advice": return advice
            case "phoneNumbers": return phone
            case "translate": return translate
            case "consulates": return consulates
            case "hospitals": return hospitals
            case "psychology": return psychology
            default: return home
        }
    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView(searchTerm: "policja", results: [Page(id: 1, name: "name", page: 1, pageName: "Numery", pageSubtitle: ""), Page(id: 2, name: "name2", page: 1, pageName: "Trudne Sytuacje", pageSubtitle: "Zbrodnia z nienawisci")])
    }
}
