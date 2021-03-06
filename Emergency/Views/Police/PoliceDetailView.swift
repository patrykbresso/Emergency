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
    @EnvironmentObject var dataLoader: DataLoader
    @State var backButtonSize: CGRect = CGRect()
    let paddingSides = CGFloat(20)
    let index: Int
    //var policeStation: Police

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
                        
                        let coordinate = CLLocationCoordinate2D(latitude: self.dataLoader.policeData.police[self.index].coordinates.latitude,longitude: self.dataLoader.policeData.police[self.index].coordinates.longitude)
                        
                        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: nil)
                        let mapItem = MKMapItem(placemark: placemark)
                        mapItem.name = self.dataLoader.policeData.police[self.index].name
                        mapItem.openInMaps(launchOptions: nil)

                    }) {
                        Image("map")
                            .renderingMode(.original)
                        
                    }
                    Spacer()
                    NavigationLink(destination: DropDown()) {
                        Text("...")
                            .foregroundColor(Color.primaryPink)
                            .font(Font.custom("ITCAvantGardePro-Bold", size: 18))
                    }
                }.padding(.bottom, 20)
                
                        MapView(coordinate: self.dataLoader.policeData.police[index].locationCoordinate)
                    .frame(width: UIScreen.screenWidth / 1.1, height: UIScreen.screenHeight / 3, alignment: .center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.white, lineWidth: 3)
                    )
                VStack {
                    NavigationLink(destination: PoliceImageView(image: self.dataLoader.policeData.police[index].imageName)) {
                        CircleImage(image: Image(self.dataLoader.policeData.police[index].imageName).resizable())
                        .frame(width: 180, height: 180)
                        .padding(.top, -100)
                    }.buttonStyle(PlainButtonStyle())
                }
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.primaryPink)
                    VStack {
                        Text(self.dataLoader.policeData.police[index].name)
                            .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                            .lineSpacing(5.0)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom, 5)
                        Text(self.dataLoader.policeData.police[index].address)
                            .font(Font.custom("ITCAvantGardePro-Bk", size: 14))
                            .lineSpacing(5.0)
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
                                .font(Font.custom("ITCAvantGardePro-Bold", size: 14))
                                .lineSpacing(5.0)
                                .padding(.bottom, 5)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        
                        }.padding(15)
                        .layoutPriority(1)
                    .foregroundColor(.white)
                    .frame(width: UIScreen.screenWidth / 1.3)
                }
                Spacer()
                    .onAppear() {
                        self.listOFNumbers = self.dividePhoneNumbers(stringNumbers: self.dataLoader.policeData.police[self.index].number)
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
        PoliceDetailView(index: 1)
    }
}

