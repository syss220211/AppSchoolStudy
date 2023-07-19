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
    case orange
    case cyan
    case yellow
    case pink
    case brown
    case green
    case gray
}

func getRankColor(_ type: RankColor) -> Color {
    switch type {
    case .red:
        return .red
    case .orange:
        return .orange
    case .cyan:
        return .cyan
    case .yellow:
        return .yellow
    case .pink:
        return .pink
    case .brown:
        return .brown
    case .green:
        return .green
    case .gray:
        return .gray
    }
}

struct RankList: Identifiable {
    var id: UUID = UUID()
    var name: String = ""
    var power: Int = 0
    var photo: String?
    var color: RankColor = .red
}

