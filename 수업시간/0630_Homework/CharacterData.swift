//
//  CharacterData.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/01.
//

import Foundation

// 캐릭터 타입, 이름
// 물, 불, 독
enum PokeType: String, Equatable {
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
    Pokemon(name: "포켓몬1", type: .fire),
    Pokemon(name: "포켓몬2", type: .water),
    Pokemon(name: "포켓몬3", type: .poison),
    Pokemon(name: "포켓몬4", type: .water),
    Pokemon(name: "포켓몬5", type: .grass),
    Pokemon(name: "포켓몬6", type: .poison),
    Pokemon(name: "포켓몬7", type: .poison),
    Pokemon(name: "포켓몬8", type: .water),
    Pokemon(name: "포켓몬9", type: .fire),
]

 
