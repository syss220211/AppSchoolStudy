//
//  Student.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/15.
//

import Foundation
import SwiftUI

// identifiable 프로토콜, 개별적으로 구분되어 겹치지 않는 값으로 Id라는 프로퍼티들을 강제로 요구함
struct Music: Identifiable {
    var id: UUID = UUID() // 이렇게 Id 만들면 Identifiable를 따른다고 설정할 수 있음
    var albumPhoto: String
    var title: String
    var artist: String
    
}

let musics: [Music] = [
    Music(albumPhoto: "르세라핌", title: "UNFORGIVEN", artist: "르세라핌"),
    Music(albumPhoto: "아이브", title: "IAM", artist: "IVE"),
    Music(albumPhoto: "에스파", title: "spicy", artist: "aespa"),
    Music(albumPhoto: "퀸카", title: "Queencard", artist: "(G)idle")
]
