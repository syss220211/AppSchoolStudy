//
//  CharacterData.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/01.
//

import Foundation

// 캐릭터 타입, 이름
// 물, 불, 독
enum PokeType: String, Equatable, Hashable, CaseIterable {
    case water = "물"
    case fire = "불"
    case poison = "독"
    case grass = "풀"
}

struct Pokemon: Hashable, Equatable {
    var name: String
    var type: PokeType
}

let pokemonData: [Pokemon] = [
    Pokemon(name: "파이리", type: .fire),
    Pokemon(name: "꼬부기", type: .water),
    Pokemon(name: "또가스", type: .poison),
    Pokemon(name: "발챙이", type: .water),
    Pokemon(name: "캐터피", type: .grass),
    Pokemon(name: "아보", type: .poison),
    Pokemon(name: "니드런", type: .poison),
    Pokemon(name: "어니부기", type: .water),
    Pokemon(name: "가디", type: .fire),
]

 
