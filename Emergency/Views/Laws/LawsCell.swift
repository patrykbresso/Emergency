//
//  LawCell.swift
//  Emergency
//
//  Created by Patryk Bresso on 04/12/2019.
//  Copyright © 2019 Wasko. All rights reserved.
//

import Foundation
import SwiftUI
import CoreLocation

struct LawsCell: View {

    var law: Laws
    var body: some View {
        

            ZStack() {
                RoundedRectangle(cornerRadius: 10)
                .stroke(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255), lineWidth: 10)
                .background(Color(red: 219 / 255, green: 2 / 255, blue: 109 / 255))
                
                Text(law.title)
                    .multilineTextAlignment(.center)
                    .font(.system(size: 14))
                    .lineLimit(4)
            }
            .foregroundColor(.white)
    }
}

struct Row: Identifiable {
    let id = UUID()
    let cells: [Laws]
}
extension Row {

       static func read() -> [Row] {
            
            var collection: [Row] = []
            var index = 0
            while index < lawsData.count - 1 {
                collection.append(Row(cells: [lawsData[index+1], lawsData[index+2]]))
                index += 2
            }
            return collection
        }
    
}

#if DEBUG
struct LawsCell_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            LawsCell(law: lawsData[0])
            LawsCell(law: lawsData[1])
        }
        .previewLayout(.fixed(width: 210, height: 120))
    }
}
#endif
