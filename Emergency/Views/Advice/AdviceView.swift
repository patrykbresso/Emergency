//
//  AdviceView.swift
//  Emergency
//
//  Created by stud on 15/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct AdviceView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var dataLoader: DataLoader
    @State private var keyword: String = ""
    @State var searchResults: [Page] = []
    @State var show: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: HorizontalAlignment.leading, spacing: 15) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        VStack {
                            Image("advice")
                                .renderingMode(.original)
                            Image("left_arrow")
                                .renderingMode(.original)
                            
                        }
                    }.padding(.leading, 15)
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                            .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                        
                         Text(self.dataLoader.adviceData.intro).padding(15)
                        
                    }.fixedSize(horizontal: false, vertical: true)
                    ScrollView {
                        ForEach(self.dataLoader.adviceData.advice) { advice in
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                                .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                                
                                Text(advice.text).padding(15).lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .padding(15)
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
            }
            .padding(15)
            .foregroundColor(.white)
            NavigationLink(destination: SearchResultsView(searchTerm: self.keyword, results: self.searchResults), isActive: self.$show, label: { EmptyView()})
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255)
        .edgesIgnoringSafeArea(.all)
        )
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

#if DEBUG
struct AdviceView_Previews: PreviewProvider {
    static var previews: some View {
        AdviceView()
    }
}
#endif
