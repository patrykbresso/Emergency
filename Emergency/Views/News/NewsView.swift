//
//  NewsView.swift
//  Emergency
//
//  Created by stud on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct NewsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var dataLoader: DataLoader
    @State var searchResults: [Page] = []
    @State var show: Bool = false
    @State private var keyword: String = ""
    
    var body: some View {
        GeometryReader { geometry in
                VStack(alignment: HorizontalAlignment.leading) {
                    
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        VStack {
                            Image("news")
                                .renderingMode(.original)
                            Image("left_arrow")
                                .renderingMode(.original)
                            
                        }.padding(.leading, 15)
                    }
                    Spacer()
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

#if DEBUG
struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
#endif
