
//
//  PoliceList.swift
//  Emergency
//
//  Created by Patryk Bresso on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//


import SwiftUI
import MapKit

struct PoliceView: View {
    @EnvironmentObject var dataLoader: DataLoader
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var keyword: String = ""
    @State var searchResults: [Page] = []
    @State var show: Bool = false
    

    
    var body: some View {
           
        GeometryReader { geometry in
            VStack {
                HStack {
                    
                    //Back button
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        VStack {
                            Image("police")
                                .renderingMode(.original)
                            Image("left_arrow")
                                .renderingMode(.original)
                        }.padding(.leading, 20)
                    }
                    Spacer()
                    
                    //Map button
                    Button(action: {
                        
                        print(self.dataLoader.policeData)
                        let listOfPoliceDepartments: [MKMapItem] = loadListOfPolicePins(listOfDepartments: self.dataLoader.policeData.police)
                        
                        
                        MKMapItem.openMaps(with: listOfPoliceDepartments, launchOptions: nil)
                        
                        
                    }) {
                        Image("map")
                            .renderingMode(.original)
                    }.padding(.trailing, 20)
                }
                
                //Title cell
                ZStack() {
                    RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.primaryPink, lineWidth: 10)
                    .background(Color.primaryPink)
                    
                    VStack {
                        Text(self.dataLoader.policeData.title)
                            .bold()
                        Text(self.dataLoader.policeData.subtitle)
                    }
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 14))
                }
                .foregroundColor(.white)
                .frame(width: geometry.size.width / 1.4, height: geometry.size.height / 9)
                
                
                //ScrollView with list of policestations
                ScrollView {
                    Spacer(minLength: 30)
                    VStack(spacing: 80) {
                        
                        ForEach(self.dataLoader.policeData.police) { policeStation in
                                NavigationLink(destination: PoliceDetailView(policeStation: policeStation)) {
                                    PoliceRow(policeStation: policeStation)
                                    }
                        }.padding(.leading, 20)
                    }.frame(width: geometry.size.width / 1.1, alignment: .center)
                }.padding(.leading, geometry.size.width / 8)
                    .padding(.top, 20)
                
                //searchbar
                HStack {
                    Image("magnifier")
                    .renderingMode(.original)
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
                    .foregroundColor(.white)
                }
                .padding(.top, 20)
                .padding(.leading, 35)
                .padding(.trailing, 35)
                .foregroundColor(.white)
            }
            NavigationLink(destination: SearchResultsView(searchTerm: self.keyword, results: self.searchResults), isActive: self.$show, label: { EmptyView()})
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.primaryBlue
            .edgesIgnoringSafeArea(.all)
        )
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}


func loadListOfPolicePins(listOfDepartments: [Police]) -> [MKMapItem] {
    var listOfPoliceDepartments: [MKMapItem] = []
    var policeDepartment: MKMapItem
    for index in 0..<listOfDepartments.count {
        let latitude = listOfDepartments[index].locationCoordinate.latitude
        let longitude = listOfDepartments[index].locationCoordinate.longitude
        let coordinate = CLLocationCoordinate2D(latitude: latitude,longitude: longitude)
        
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
        policeDepartment = MKMapItem(placemark: placemark)
        policeDepartment.name = listOfDepartments[index].name
        listOfPoliceDepartments.append(policeDepartment)
    }
    return listOfPoliceDepartments
}

struct PoliceView_Previews: PreviewProvider {
    static var previews: some View {
        PoliceView()
    }
}

