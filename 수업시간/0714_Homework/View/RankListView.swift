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
//    @State var ranker: RankList = RankList()
    @State var rankChoiceState: Bool = false
    
    
    var body: some View {
        NavigationStack {
                List(rankListStore.addedRanker) { ranker in
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
                    .swipeActions {
                        Button("삭제"){
                            rankListStore.removeRankList(rankList: ranker)
                        }.tint(Color.red)
                    }
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
                    RankerChoiceView(rankChoiceState: $rankChoiceState, rankListStore: rankListStore)
                }
    
                // 정렬 버튼 추가 테스트
                Button {
                    let sortedRanker = rankListStore.addedRanker.sorted { $0.power > $1.power }
                    rankListStore.addedRanker = sortedRanker
                } label: {
                    Text("랭커 정렬하기")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(.clear)
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
