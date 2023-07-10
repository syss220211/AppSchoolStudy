//
//  Sticker.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/10.
//

import Foundation
import SwiftUI

enum ColorType: String, Codable, CaseIterable {
    case red
    case blue
    case cyan
    case yellow
    case brown
}

func getColorType(_ type: ColorType) -> Color {
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

struct Sticker: Identifiable, Codable {
    var id: UUID = UUID()
    var memo: String = ""
    var date: Date = Date()
    var color: ColorType = .red
    
    var dateString: String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy-MM-dd HH:mm"
        return dateFormatter.string(from: date)
    }
    
}
