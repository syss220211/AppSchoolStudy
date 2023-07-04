//
//  Basic.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/04.
//

import Foundation

// 대한민국의 기초지방자치단체

// 시
struct City: Region {
    var id: UUID = UUID()
    var name: String
    var displayName: String {
        get {
            return "\(name)시"
        }
    }
}

// 군
struct Country: Region {
    var id: UUID = UUID()
    var name: String
    var displayName: String {
        get {
            return "\(name)군"
        }
    }
}

// 구
struct District: Region {
    var id: UUID = UUID()
    var name: String
    var displayName: String {
        get {
            return "\(name)구"
        }
    }
}
