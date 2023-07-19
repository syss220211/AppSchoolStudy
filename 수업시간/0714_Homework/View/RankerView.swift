//
//  RankerView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/19.
//

import SwiftUI

struct RankerView: View {
    
    var rankListStore: RankListStore
    var ranker: RankList
    
    
    var body: some View {
        HStack {
            Text("\(ranker.name)")
            Spacer()
//                    .listRowBackground(getRankColor(ranker.color))
            Text("\(ranker.power)")
        }
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(getRankColor(ranker.color))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 8)
        .foregroundColor(.white)
        

    }
}

struct RankerView_Previews: PreviewProvider {
    static var previews: some View {
        RankerView(rankListStore: RankListStore(), ranker: RankList())
    }
}
