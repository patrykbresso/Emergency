//
//  PoliceDetail.swift
//  Emergency
//
//  Created by Patryk Bresso on 16/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//


import SwiftUI
import MapKit

struct PoliceDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var backButtonSize: CGRect = CGRect()
    let paddingSides = CGFloat(20)
    var policeStation: Police

    @State var listOFNumbers = [Numbers]()

    var body: some View {
                    VStack {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("left_arrow")
                            .renderingMode(.original)
                    }.background(GeometryGetter(rect: self.$backButtonSize))
                    Spacer()
                    Button(action: {
                        
                        let coordinate = CLLocationCoordinate2D(latitude: self.policeStation.coordinates.latitude,longitude: self.policeStation.coordinates.longitude)
                        
                        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
                        let mapItem = MKMapItem(placemark: placemark)
                        mapItem.name = self.policeStation.name
                        mapItem.openInMaps(launchOptions: nil)

                    }) {
                        Image("map")
                            .renderingMode(.original)
                        
                    }
                    Spacer()
                    NavigationLink(destination: DropDown()) {
                        Text("...")
                            .foregroundColor(Color.primaryPink)
                            .bold()
                    }
                }
                Spacer(minLength: 20)
                
                MapView(coordinate: self.policeStation.locationCoordinate)
                    .frame(width: UIScreen.screenWidth / 1.1, height: UIScreen.screenHeight / 3, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.white, lineWidth: 3)
                    )
                VStack {
                    NavigationLink(destination: PoliceImageView(image: self.policeStation.imageName)) {
                        CircleImage(image: Image(self.policeStation.imageName).resizable())
                        .frame(width: 180, height: 180)
                        .padding(.top, -100)
                    }.buttonStyle(PlainButtonStyle())
                }
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.primaryPink)
                    VStack {
                        Text(self.policeStation.name)
                            .fontWeight(.bold)
                            .font(Font.custom("AvantGardeBold", size: 14))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 5)
                        Text(self.policeStation.address)
                            .font(Font.custom("AvantGardeNormal", size: 14))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 5)
                        ForEach(self.listOFNumbers) { number in
                            Button(action: {
                                let cleanString = String(number.name.filter { !" \n\t\r".contains($0) })
                                let tel = "tel://"
                                let formattedString = tel + cleanString
                                let url: NSURL = URL(string: formattedString)! as NSURL
                                UIApplication.shared.open(url as URL)
                               }) {
                                
                            
                                Text(number.name)
                                .fontWeight(.bold)
                                .font(Font.custom("AvantGardeBold", size: 14))
                                .padding(.bottom, 5)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        
                        }.padding(10)
                        .layoutPriority(1)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.screenWidth / 1.3)
                }
                Spacer()
                    .onAppear() {
                        self.listOFNumbers = self.dividePhoneNumbers(stringNumbers: self.policeStation.number)
                        }
            }
            .padding([.leading, .trailing], self.paddingSides)
            .background(Color.primaryBlue
            .edgesIgnoringSafeArea(.all)
            )
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
        
        
    }
    
 func dividePhoneNumbers(stringNumbers: String) -> [Numbers]{
        var numbers = [Numbers]()
        let array = stringNumbers.components(separatedBy: ";")
        
        
        for i in array {
            let uuid = UUID()
            numbers.append(Numbers(id: uuid, name: i))
        }
    return numbers
    }
}


struct PoliceDetailView_Preview: PreviewProvider {
    static var previews: some View {
        PoliceDetailView(policeStation: policeData.police[1])
    }
}

