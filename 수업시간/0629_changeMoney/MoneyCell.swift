//
//  MoneyCell.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/29.
//

import SwiftUI

struct MoneyCell: View {
    var nation: String
    var placeholder: String
    var result: String
    var colorTest: Color
    
    @Binding var enteredMoney: String
    
    var body: some View {
        VStack {
            HStack {
                Text(nation)
                TextField(placeholder, text: $enteredMoney).font(.system(size: 13))
            }
            .padding(.all, 9)
            
            Divider()
            Text(result)
                .font(.system(size: 15))
                .frame(alignment: .leading)
                .foregroundColor(colorTest)
                .padding(.all, 9)
        }.overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black, lineWidth: 2))
    }
}

//struct MoneyCell_Previews: PreviewProvider {
//    static var previews: some View {
//        MoneyCell()
//    }
//}
