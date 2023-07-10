//
//  Sticker.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/10.
//

import Foundation
import SwiftUI

struct Sticker: Identifiable, Hashable {
    var id: UUID = UUID()
    var memo: String
    var color: Color
    var date: Date
    
    var dateString: String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yy-MM-dd HH:mm"
        return dateFormatter.string(from: date)
    }
    
}
