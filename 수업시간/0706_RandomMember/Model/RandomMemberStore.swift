//
//  RandomMemberStore.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/06.
//

import Foundation
import Combine

class RandomMemberStore: ObservableObject {
    
    @Published var members: [RandomMember] = []
    
    var randomMember: RandomMember {
        members.randomElement() ?? RandomMember(name: "(없는멤버)")
    }
    
    var membersEmpty: Bool {
        members.isEmpty
    }
    
    // 데이터 추가
    func addMember(name: String) {
        if name.count > 0 {
            let member: RandomMember = RandomMember(name: name)
            members.append(member)
        }
    }
    
    // 데이터 삭제
    func removeMembersAll() {
        members.removeAll()
    }
}
