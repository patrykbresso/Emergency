
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
    @State var backButtonSize: CGRect = CGRect()
    let paddingSides = CGFloat(20)
    
    var body: some View {

            VStack {
                HStack {
                    
                    //Back button
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        VStack {
                            Image("left_arrow")
                                .renderingMode(.original)
                        }
                    }.background(GeometryGetter(rect: self.$backButtonSize))
                    Spacer()
                    Image("police")
                        .renderingMode(.original)
                        .padding(.leading, self.backButtonSize.width)
                    Spacer()
                    //Map button
                    Button(action: {
                        
                        print(self.dataLoader.policeData)
                        let listOfPoliceDepartments: [MKMapItem] = loadListOfPolicePins(listOfDepartments: self.dataLoader.policeData.police)
                        
                        
                        MKMapItem.openMaps(with: listOfPoliceDepartments, launchOptions: nil)
                        
                        
                    }) {
                        Image("map")
                            .renderingMode(.original)
                    }
                }
                
                //Title cell
                ZStack() {
                    RoundedRectangle(cornerRadius: 10)
                    .fill(Color.primaryPink)
                    
                    VStack {
                        Text(self.dataLoader.policeData.title)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                        Text(self.dataLoader.policeData.subtitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .multilineTextAlignment(.leading)
                        }.padding(5)
                    .multilineTextAlignment(.center)
                    .layoutPriority(1)
                    }.padding(5)
                    .frame(width: UIScreen.screenWidth / 1.3)
                .foregroundColor(.white)
                
                
                
                //ScrollView with list of policestations
                ScrollView(showsIndicators: false) {
                    Spacer(minLength: 30)
                    VStack(spacing: 30) {
                        
                        ForEach(self.dataLoader.policeData.police) { policeStation in
                                NavigationLink(destination: PoliceDetailView(policeStation: policeStation)) {
                                    PoliceRow(policeStation: policeStation)
                                }
                        }
                    }
                }.frame(width: UIScreen.screenWidth / 1.35)

            }

        .padding([.leading, .trailing], self.paddingSides)
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

