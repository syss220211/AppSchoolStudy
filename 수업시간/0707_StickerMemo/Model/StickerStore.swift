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
    init() {
        stickers = [
            Sticker(memo: "Hello", color: .blue, date: Date()),
            Sticker(memo: "Hi", color: .cyan, date: Date()),
            Sticker(memo: "Good morning", color: .yellow, date: Date()),
        ]
    }
    
    // 메모 추가
    func addSticker(memo: String, color: Color) {
        let sticker = Sticker(memo: memo, color: color, date: Date())
        stickers.insert(sticker, at: 0)
    }
    
    
    // 메모 삭제
    func removeSticker(sticker: Sticker) {
        var index: Int = 0
        
        for removeSticker in stickers {
            if removeSticker.id == sticker.id {
                stickers.remove(at: index)
                break
            }
            index += 1
        }
    }
}
