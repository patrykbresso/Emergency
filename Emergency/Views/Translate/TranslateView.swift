//
//  TranslateView.swift
//  Emergency
//
//  Created by stud on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct TranslateView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var dataLoader: DataLoader
    @State private var keyword: String = ""
    @State var buttonClicked: [Bool] = [false, false, false, false, false, false]
    @State var searchResults: [Page] = []
    @State var show: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: HorizontalAlignment.leading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    VStack {
                        Image("translate")
                            .renderingMode(.original)
                        Image("left_arrow")
                            .renderingMode(.original)
                        
                    }
                }
                ForEach(self.dataLoader.translateData) { row in
                    if(row.id % 2 == 0) {
                        HStack {
                            Button(action: {
                                self.onBoxClick(boxNo: row.id - 1)
                            }) {
                                TranslateCell(row: row, showTranslation: self.buttonClicked[row.id - 1])
                                    .frame(width: 150)
                            }
                            Spacer()
                            }
                            .padding(.bottom, 5)
                    } else {
                        HStack {
                            Spacer()
                            Button(action: {
                                self.onBoxClick(boxNo: row.id - 1)
                            }) {
                                TranslateCell(row: row, showTranslation: self.buttonClicked[row.id - 1])
                                .frame(width: 150)
                            }
                        }
                        .padding(.bottom, 5)
                    }
                }
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
                .foregroundColor(.white)
                    
            }
            .padding(.leading, geometry.size.width / 10)
            .padding(.trailing, geometry.size.width / 10)
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
    
    func onBoxClick(boxNo: Int) {
        buttonClicked[boxNo] = buttonClicked[boxNo] ? false : true
    }
}

#if DEBUG
struct TranslateView_Previews: PreviewProvider {
    static var previews: some View {
        TranslateView()
    }
}
#endif
