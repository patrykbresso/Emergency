//
//  PhoneNumbersView.swift
//  Emergency
//
//  Created by stud on 17/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct PhoneNumbersView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var dataLoader: DataLoader
    @State private var keyword: String = ""
    @State var boxClicked: [Bool] = [false, false, false, false, false, false]
    @State var searchResults: [Page] = []
    @State var show: Bool = false
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: HorizontalAlignment.leading) {
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    VStack {
                        Image("phone")
                            .renderingMode(.original)
                        Image("left_arrow")
                            .renderingMode(.original)
                        
                    }.padding(.leading, 15)
                }
                
                VStack {
                    ForEach(self.dataLoader.phoneNumbersData){ row in
                        if(row.id % 2 == 0) {
                            HStack {
                                Button(action: {
                                    self.onBoxClick(boxNo: row.id - 1)
                                }) {
                                    PhoneNumbersCell(phoneNumber: row, showDescription: self.boxClicked[row.id - 1])
                                        
                                }.frame(width: 155)
                                Spacer()
                                }
                                .padding(.bottom, 5)
                        } else {
                            HStack {
                                Spacer()
                                Button(action: {
                                    self.onBoxClick(boxNo: row.id - 1)
                                }) {
                                    PhoneNumbersCell(phoneNumber: row, showDescription: self.boxClicked[row.id - 1])
                                    
                                }.frame(width: 155)
                            }
                            .padding(.bottom, 5)
                        }
                    }
                }
                .padding(.leading, 15)
                .padding(.trailing, 15)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
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
    
    func clearPreviousClick(boxNo: Int) {
        for n in 0...5 {
            if (n != boxNo && self.boxClicked[n]) {
                self.boxClicked[n] = false
            }
        }
    }
    
    func onBoxClick(boxNo: Int) {
        self.clearPreviousClick(boxNo: boxNo)
        self.boxClicked[boxNo] = self.boxClicked[boxNo] ? false : true
    }
}

#if DEBUG
struct PhoneNumbersView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumbersView()
    }
}
#endif
