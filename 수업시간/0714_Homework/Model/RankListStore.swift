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
            RankList(name: "랭커3", power: 90, color: .orange),
            RankList(name: "랭커4", power: 1, color: .cyan)
        ]
    }
    
    // 랭커 추가
    func addRankList(choicedRanker: RankList) {

        addedRanker.insert(choicedRanker, at: 0)
//        saveStickers()
    }
    
    // 랭커 삭제
    func removeRankList(rankList: RankList) {
        if let index = rankLists.firstIndex(where: { $0.id == rankList.id }) {
            addedRanker.remove(at: index)
        }
    }
}

//class StickerStore: ObservableObject {
//
//    @Published var stickers: [Sticker] = []
//    func fetchStickers() {
//        do {
//            if let data = UserDefaults.standard.object(forKey: "Stickers") as? Data {
//                let decoder: JSONDecoder = JSONDecoder()
//                stickers = try decoder.decode([Sticker].self, from: data)
//            }
//        } catch {
//            print("UserDefaults로 부터 데이터 가져오기 실패")
//        }
//    }
//
//    func saveStickers() {
//        // JSON으로 배열 등등의 복잡 데이터를 단일한 데이터로 만들어준다 -> 데이터를 userDefault에 저장
//        do {
//            let endcoder: JSONEncoder = JSONEncoder()
//            let data: Data = try endcoder.encode(stickers)
//
//            UserDefaults.standard.set(data, forKey: "Stickers")
//        } catch {
//            print("JSON 생성 후 UserDefaults 실패")
//        }
//    }
//}
