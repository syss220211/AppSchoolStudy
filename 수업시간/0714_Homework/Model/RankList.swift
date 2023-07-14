//
//  RankList.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/14.
//

import Foundation
import SwiftUI

enum RankColor: String, Codable, CaseIterable {
    case red
    case blue
    case cyan
    case yellow
    case brown
}

func getRankColor(_ type: ColorType) -> Color {
    switch type {
    case .red:
        return .red
    case .blue:
        return .blue
    case .cyan:
        return .cyan
    case .yellow:
        return .yellow
    case .brown:
        return .brown
    }
}

struct RankList: Identifiable {
    var id: UUID = UUID()
    var name: String = ""
    var power: Int = 0
    var photo: String?
    var color: RankColor = .red
}
