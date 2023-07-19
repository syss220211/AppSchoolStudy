//
//  StickerStore.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/10.
//

import Foundation
import SwiftUI

class RankListStore: ObservableObject {
    @Published var rankLists: [RankList] = []
    @Published var addedRanker: [RankList] = []

    init() {
        rankLists = [
            RankList(name: "랭커1", power: 10, color: .pink),
            RankList(name: "랭커2", power: 20, color: .red),
            RankList(name: "랭커3", power: 878, color: .orange),
            RankList(name: "랭커4", power: 40, color: .cyan),
            RankList(name: "랭커5", power: 91230, color: .brown),
            RankList(name: "랭커6", power: 9440, color: .gray),
            RankList(name: "랭커7", power: 320, color: .green),
            RankList(name: "랭커8", power: 34, color: .red),
            RankList(name: "랭커9", power: 12, color: .green),
            RankList(name: "랭커10", power: 90, color: .gray)
        ]
    }
    
    // 랭커 추가
    func addRankList(choicedRanker: RankList) {
        addedRanker.insert(choicedRanker, at: 0)
    }
    
    // 랭커 삭제
    func removeRankList(rankList: RankList) {
        if let index = addedRanker.firstIndex(where: { $0.id == rankList.id }) {
            addedRanker.remove(at: index)
        }
    }
    
    // 랭커 전체 삭제
    func removeAllRankList() {
        addedRanker.removeAll()
    }
}
