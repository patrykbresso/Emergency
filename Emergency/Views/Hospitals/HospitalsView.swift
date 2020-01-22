//
//  PoliceList.swift
//  Emergency
//
//  Created by Patryk Bresso on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//


import SwiftUI

struct HospitalsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var keyword: String = ""
    @State var searchResults: [Page] = []
    @State var show: Bool = false
    @EnvironmentObject var dataLoader: DataLoader

    var body: some View {
          
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Color.primaryBlue
                .edgesIgnoringSafeArea(.all)
                VStack(spacing: 40) {
                    HStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            VStack {
                                Image("hospital")
                                    .renderingMode(.original)
                                Image("left_arrow")
                                    .renderingMode(.original)
                                
                            }
                        }
                        Spacer()
                    }.padding(.leading, 80)
                    ZStack() {
                        RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.primaryPink, lineWidth: 10)
                        .background(Color.primaryPink)
                        
                        VStack {
                            Text(self.dataLoader.hospitalsData.title)
                                .bold()
                            Text(self.dataLoader.hospitalsData.subtitle)
                        }
                        .multilineTextAlignment(.leading)
                        
                    }
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .frame(width: geometry.size.width / 1.3, height: geometry.size.height / 4.5)
                    ScrollView() {
                        Spacer(minLength: 30)
                        VStack(alignment: .center, spacing: 80) {
                            ForEach(self.dataLoader.hospitalsData.hospitals) { hospital in
                                HospitalsRow(hospital: hospital)
                                }.padding(.leading, 40)
                        }.frame(width: geometry.size.width / 0.95, alignment: .center)
                    }.padding(.leading, geometry.size.width / 8)
                    //searchbar
                    HStack {
                        Image("magnifier")
                        .renderingMode(.original)
                        .padding(.leading, 80)
                        Spacer(minLength: 50)
                        ZStack {
                            if(self.keyword.isEmpty) {
                                Text("szukaj...")
                            }
                            TextField("", text: self.$keyword, onCommit: {
                                let searchController: SearchController = SearchController(dataLoader: self.dataLoader)
                                self.searchResults = searchController.searchByKeywords(searchedPhrase: self.keyword)
                                self.show = true
                            })
                            .textFieldStyle(CustomTextFieldStyle())
                        }
                        .padding(.trailing, 40)
                        .foregroundColor(.white)
                    }
                }
                NavigationLink(destination: SearchResultsView(searchTerm: self.keyword, results: self.searchResults), isActive: self.$show, label: { EmptyView()})
            }
            
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }

}

struct HospitalsView_Previews: PreviewProvider {
    static var previews: some View {
        HospitalsView()
    }
}
