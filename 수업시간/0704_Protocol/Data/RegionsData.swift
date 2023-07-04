//
//  RegionsData.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/04.
//

import Foundation

let specialCities: [SpeicalCity] = [
    SpeicalCity(name: "서울", disricts: [
        District(name: "종로"),
        District(name: "중"),
        District(name: "용산"),
        District(name: "성동"),
        District(name: "광진"),
        District(name: "동대문"),
        District(name: "중랑"),
        District(name: "성북"),
        District(name: "강북"),
        District(name: "도봉"),
        District(name: "노원"),
        District(name: "은평"),
        District(name: "서대문"),
        District(name: "마포"),
        District(name: "양천"),
        District(name: "강서"),
        District(name: "구로"),
        District(name: "금천"),
        District(name: "영등포"),
        District(name: "동작"),
        District(name: "관악"),
        District(name: "서초"),
        District(name: "강남"),
        District(name: "송파"),
        District(name: "강동"),
    ])
]

let metroCities: [MetroCity] = [
    MetroCity(name: "부산", disricts: []),
    MetroCity(name: "인천", disricts: []),
    MetroCity(name: "대구", disricts: []),
    MetroCity(name: "광주", disricts: []),
    MetroCity(name: "대전", disricts: []),
    MetroCity(name: "울산", disricts: []),
]

let specialGovCities: [SpeicalGovCity] = [
    SpeicalGovCity(name: "세종")
]

let provinces : [Province] = [
    Province(name: "경기", cities: [], countries: []),
    Province(name: "충청북", cities: [], countries: []),
    Province(name: "충청남", cities: [], countries: []),
    Province(name: "전라북", cities: [], countries: []),
    Province(name: "전라남", cities: [], countries: []),
    Province(name: "경상북", cities: [], countries: []),
    Province(name: "경상남", cities: [], countries: []),
]

let specialProvinces : [SpecialProvince] = [
    SpecialProvince(name: "강원", cities: [
        City(name: "춘천"),
        City(name: "원주"),
        City(name: "강릉"),
        City(name: "동해"),
        City(name: "태백"),
        City(name: "속초"),
        City(name: "삼척"),
    ], countries: [
        Country(name: "홍천"),
        Country(name: "횡성"),
        Country(name: "영월"),
        Country(name: "평창"),
        Country(name: "정선"),
        Country(name: "철원"),
        Country(name: "화천"),
        Country(name: "양구"),
        Country(name: "인제"),
        Country(name: "고성"),
        Country(name: "양양"),
    ]),
    SpecialProvince(name: "제주", cities: [
        City(name: "제주"),
        City(name: "서귀포"),
    ], countries: []),
]

