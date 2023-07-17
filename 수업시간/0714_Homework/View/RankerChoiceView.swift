//
//  RankerChoiceView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/14.
//

import SwiftUI

struct RankerChoiceView: View {
    
    // 데이터 생성 및 초기화
    @State var rankAddState: Bool = false
    @Binding var rankChoiceState: Bool
    
    var rankListStore: RankListStore
    var ranker: RankList
        
    var body: some View {
        NavigationStack {
            List(rankListStore.rankLists) { ranker in
                Button {
                    rankListStore.addRankList(choicedRanker: ranker)
                    print(ranker.name)
                    rankChoiceState = false
                } label: {
                    VStack{
                        HStack {
                            Text(ranker.name)
                                .font(.title3)
                            Spacer()
                            Text("power : \(ranker.power)")
                                .font(.title3)
                        }
                        .padding(20)
                        .background(getRankColor(ranker.color))
                        .shadow(radius: 8)
                        .foregroundColor(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    }
                }
            }
            
            .listStyle(.plain)
            .navigationTitle("Ranker 목록")
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        rankAddState = true
                    } label: {
                        Label("add", systemImage: "pencil.tip.crop.circle.badge.plus")
                    }
                }
            }
            .sheet(isPresented: $rankAddState) {
                RankListView(rankListStore: rankListStore)
            }

        }
    }
}

struct RankerChoiceView_Previews: PreviewProvider {
    static var previews: some View {
//        StickerAddView(stickerStore: StickerStore(), addState: .constant(true))
        RankerChoiceView(rankChoiceState: .constant(true), rankListStore: RankListStore(), ranker: RankList())
    }
}
