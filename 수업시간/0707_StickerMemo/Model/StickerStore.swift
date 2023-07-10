//
//  StickerStore.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/10.
//

import Foundation
import SwiftUI

class StickerStore: ObservableObject {
    
    @Published var stickers: [Sticker] = []
    
    // 테스트 데이터
//    init() {
//        stickers = [
//            Sticker(memo: "Hello", date: Date(), color: .blue),
//            Sticker(memo: "Hi", date: Date(), color: .cyan),
//            Sticker(memo: "Good morning", date: Date(), color: .yellow),
//        ]
//    }
    
    func fetchStickers() {
        do {
            if let data = UserDefaults.standard.object(forKey: "Stickers") as? Data {
                let decoder: JSONDecoder = JSONDecoder()
                stickers = try decoder.decode([Sticker].self, from: data)
            }
        } catch {
            print("UserDefaults로 부터 데이터 가져오기 실패")
        }
    }
    
    func saveStickers() {
        // JSON으로 배열 등등의 복잡 데이터를 단일한 데이터로 만들어준다
        do {
            let endcoder: JSONEncoder = JSONEncoder()
            let data: Data = try endcoder.encode(stickers)

            UserDefaults.standard.set(data, forKey: "Stickers")
        } catch {
            print("JSON 생성 후 UserDefaults 실패")
        }
    }
    
    
    // 메모 추가
//    func addSticker(memo: String, color: ColorType) {
//        let sticker = Sticker(memo: memo, date: Date(), color: color)
//        stickers.insert(sticker, at: 0)
//    }
    func addSticker(memo: String, color: ColorType) {
        let sticker = Sticker(memo: memo, date: Date(), color: color)
        stickers.insert(sticker, at: 0)
//        stickers.append(sticker)
        saveStickers()
    }
    
    // 메모 삭제
    func removeSticker(sticker: Sticker) {
        if let index = stickers.firstIndex(where: { $0.id == sticker.id }) {
            stickers.remove(at: index)
            saveStickers() // Save stickers after removing a sticker
        }
    }

    // 메모 수정
    func updateSticker(sticker: Sticker) {
//        if let index = stickers.firstIndex(where: { $0.id == sticker.id }) {
//            stickers[index] = sticker
//            saveStickers() // Save stickers after updating a sticker
//        }
        if let index = stickers.firstIndex(where: { $0.id == sticker.id }) {
                stickers[index].memo = sticker.memo
                stickers[index].date = sticker.date
                stickers[index].color = sticker.color
                saveStickers() // Save stickers after updating a sticker
            }
    }
    
    
//    // 메모 삭제
//    func removeSticker(sticker: Sticker) {
//        var index: Int = 0
//
//        for removeSticker in stickers {
//            if removeSticker.id == sticker.id {
//                stickers.remove(at: index)
//                break
//            }
//            index += 1
//        }
//    }

//    // 메모 수정
//    func updateSticker(sticker: Sticker) {
//        var index: Int = 0
//
//        for updateSticker in stickers {
//            if updateSticker.id == sticker.id {
//                stickers.remove(at: index)
//                stickers.insert(sticker, at: 0)
//                saveStickers()
//                break
//            }
//            index += 1
//        }
//    }
}
