//
//  FinalView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/21.
//

import SwiftUI

struct FinalView: View {
    var score: Int
    var WrongScore: Int
    
    var body: some View {
        VStack {
            ReuseableText(text: "수고하셨습니다 !", size: 35)
                .padding(.bottom, 30)
            ReuseableText(text: "최종점수는 \(score)점입니다.", size: 25)
                .padding(.bottom, 40)
            ReuseableText(text: "맞춘 문제 : \(score)개", size: 20)
                .foregroundColor(.blue)
            ReuseableText(text: "틀린 문제 : \(WrongScore)개", size: 20)
                .foregroundColor(.red)
            
        }
        
    }
}

//struct FinalView_Previews: PreviewProvider {
//    static var previews: some View {
//        FinalView(score: 5, WrongScore: 2)
//    }
//}

