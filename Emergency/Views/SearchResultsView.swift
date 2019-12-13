//
//  SearchResultsView.swift
//  Emergency
//
//  Created by Paulina Binas on 13/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct SearchResultsView: View {
    var results: [Page]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                        .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                        .frame(width: 250, height: 150)
                    Text("No results were found")
                }
            }
                .foregroundColor(.white)
                .padding(15)
        }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .background(Color(red: 19 / 255, green: 42 / 255, blue: 122 / 255))
            .edgesIgnoringSafeArea(.all)
    }
}

struct SearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultsView(results: [Page(name: "name", page: 1)])
    }
}
