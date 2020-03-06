
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
                    Spacer()
                    NavigationLink(destination: DropDown()) {
                        Text("...")
                            .foregroundColor(Color.primaryPink)
                            .font(Font.custom("ITCAvantGardePro-Bold", size: 18))
                    }
                }.padding(.bottom, 20)
                
                //Title cell
                VStack {
                    ZStack() {
                        RoundedRectangle(cornerRadius: 10)
                        .fill(Color.primaryPink)
                        
                        VStack {
                            Text(self.dataLoader.policeData.title)
                                .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                                .lineSpacing(5.0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 5)
                            Text(self.dataLoader.policeData.subtitle)
                                .font(Font.custom("ITCAvantGardePro-Bk", size: 14))
                                .lineSpacing(5.0)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(.leading)
                                .padding(.bottom, 5)
                            Button(action: {
                                let cleanString = String("112")
                                let tel = "tel://"
                                let formattedString = tel + cleanString
                                let url: NSURL = URL(string: formattedString)! as NSURL
                                UIApplication.shared.open(url as URL)
                               }) {
                                Text("112")
                                .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            }.padding(15)
                        .multilineTextAlignment(.center)
                        .layoutPriority(1)
                        }
                        .foregroundColor(.white)
                    //Map button
                    Button(action: {
                        
                        print(self.dataLoader.policeData)
                        let listOfPoliceDepartments: [MKMapItem] = loadListOfPolicePins(listOfDepartments: self.dataLoader.policeData.police)
                        
                        
                        MKMapItem.openMaps(with: listOfPoliceDepartments, launchOptions: nil)
                        
                        
                    }) {
                        Image("map")
                            .renderingMode(.original)
                    }.padding(.top, 10).padding(.bottom, 20)
                }
                
                
                //ScrollView with list of policestations
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 30) {
                        
                        ForEach((0...(self.dataLoader.difficultSituationsData.count - 1)), id: \.self) { i in
                            NavigationLink(destination: PoliceDetailView(index: i)) {
                                PoliceRow(policeStation: self.dataLoader.policeData.police[i])
                            }
                        
                        }

                    }
                }.padding(.bottom, paddingSides)

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

