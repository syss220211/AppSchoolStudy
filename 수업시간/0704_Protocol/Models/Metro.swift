//
//  Metro.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/04.
//


import Foundation

// 대한민국의 광역지방자치단체

// 특별시
struct SpeicalCity: Region, MetroDistrict {
    var id: UUID = UUID()
    var name: String
    var displayName: String {
        get {
            return "\(name)특별시"
        }
    }
    
    var disricts: [District]
}

// 광역시
struct MetroCity: Region, MetroDistrict {
    var id: UUID = UUID()
    var name: String
    var displayName: String {
        return "\(name)광역시"
    }
    
    var disricts: [District]
}

// 특별자치시
struct SpeicalGovCity: Region {
    var id: UUID = UUID()
    var name: String
    var displayName: String {
        return "\(name)특별자치시"
    }
}

// 도
struct Province: Region, MetroProvine {
    var id: UUID = UUID()
    var name: String
    var displayName: String {
        return "\(name)도"
    }
    
    var cities: [City]
    var countries: [Country]
}

// 특별자치도도
struct SpecialProvince: Region, MetroProvine {
    var id: UUID = UUID()
    var name: String
    var displayName: String {
        return "\(name)특별자치도"
    }
    
    var cities: [City]
    var countries: [Country]
}
