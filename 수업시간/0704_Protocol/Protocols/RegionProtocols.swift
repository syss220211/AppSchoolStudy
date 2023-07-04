//
//  RegionProtocols.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/04.
//

import Foundation

protocol Region: Identifiable {
    var name: String { get set }
    var displayName: String { get }
}
