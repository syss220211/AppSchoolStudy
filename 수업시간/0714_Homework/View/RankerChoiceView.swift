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
    @State var showAlert: Bool = false
    
    var rankListStore: RankListStore
//    var ranker: RankList
        
    var body: some View {
        NavigationStack {
            List(rankListStore.rankLists) { ranker in
                Button {
                    if !rankListStore.addedRanker.contains(where: { $0.id == ranker.id }) {
                        rankListStore.addRankList(choicedRanker: ranker)
                        print(ranker.name)
                        rankChoiceState = false
                    } else {
                        showAlert = true
                    }
                } label: {
                    VStack {
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
            .alert("랭커 리스트를 확인해주세요", isPresented: $showAlert) {
                Button("확인", role: .cancel) { }
            } message: {
                Text("랭커는 중복으로 추가할 수 없습니다")
            }
            .listStyle(.plain)
            .navigationTitle("Ranker 목록")
        }
    }
}

struct RankerChoiceView_Previews: PreviewProvider {
    static var previews: some View {
//        StickerAddView(stickerStore: StickerStore(), addState: .constant(true))
        RankerChoiceView(rankChoiceState: .constant(true), rankListStore: RankListStore())
    }
}
