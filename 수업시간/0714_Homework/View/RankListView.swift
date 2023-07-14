//
//  RankListView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/14.
//

import SwiftUI

struct RankListView: View {
    
    // 데이서 생성 및 초기화
    @ObservedObject var rankListStore: RankListStore = RankListStore()
    @State var ranker: RankList = RankList()
    @State var rankChoiceState: Bool = false
    
    @State var addedRanker: [RankList] = []
    
    var body: some View {
        NavigationStack {
            List(rankListStore.rankLists) { ranker in
                Text("\(ranker.name)")
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        rankChoiceState = true
                    } label: {
                        Label("add", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $rankChoiceState) {
                RankerChoiceView(rankChoiceState: $rankChoiceState, addedRanker: addedRanker, rankListStore: rankListStore, ranker: ranker)
            }
            .navigationTitle("Ranker List")
        }
    }
}

struct RankListView_Previews: PreviewProvider {
    static var previews: some View {
        RankListView(rankListStore: RankListStore())
    }
}
