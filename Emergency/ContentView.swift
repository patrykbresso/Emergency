//
//  ContentView.swift
//  Emergency
//
//  Created by Patryk Bresso on 11/11/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //@State private var keyword: String = ""
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading) {
            NavigationView {
                VStack(alignment: .leading) {
                    HStack() {
                        NavigationLink(destination: NewsView()) {
                            Text("NEWSY")
                        }
                        Spacer()
                        NavigationLink(destination: AdviceView()) {
                            Text("PORADY RÓŻNE")
                        }
                    }
                    .padding(50)
                    HStack() {
                        NavigationLink(destination: TranslateView()) {
                            Text("TLUMACZ")
                        }
                        Spacer()
                        NavigationLink(destination: PhoneNumbersView()) {
                            Text("TELEFONY")
                        }
                    }
                    .padding(50)
                    HStack() {
                        NavigationLink(destination: HelpView()) {
                            Text("POMOC OD UCZELNI")
                        }
                        Spacer()
                        NavigationLink(destination: LawView()) {
                            Text("PRZEPISY")
                        }
                    }
                    .padding(50)
                    HStack() {
                        NavigationLink(destination: DifficultSituationsView()) {
                            Text("TRUDNE SYTUACJE")
                        }
                        Spacer()
                        NavigationLink(destination: ConsulatesView()) {
                            Text("KONSULATY")
                        }
                    }
                    .padding(50)
                    HStack() {
                        NavigationLink(destination: HospitalsView()) {
                            Text("SZPITALE")
                        }
                        Spacer()
                        NavigationLink(destination: PoliceView()) {
                            Text("POLICJA")
                        }
                    }
                    .padding(50)
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            }
            /*HStack() {
                TextField("WYSZUKAJ", text:$keyword)
                    .textFieldStyle(.roundedBorder)
            }*/
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
