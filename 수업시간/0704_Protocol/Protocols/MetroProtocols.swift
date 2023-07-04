//
//  MetroProtocols.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/04.
//

import Foundation

// '구'를 기초단체로 하는 특별시, 광역시 등...
protocol MetroDistrict {
    var disricts: [District] { get set }
}

// '시', '군'을 기초단체로 하는 도, 특별자치도
protocol MetroProvine {
    var cities: [City] { get set }
    var countries: [Country] { get set }
}
