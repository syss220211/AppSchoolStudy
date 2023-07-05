//
//  ToDo.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/05.
//

import Foundation

enum Completion {
    case finish
    case notFinish
}

struct Todo: Identifiable, Equatable, Hashable {
    var id: UUID = UUID()
    var agenda: String
    var startDate: Date
    var dueDate: Date
    var completion: Bool
        
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        return formatter
    }()
    
    var formattedDueDate: String {
        return Todo.dateFormatter.string(from: dueDate)
    }
   
    var formattedStartDate: String {
        return Todo.dateFormatter.string(from: startDate)
    }
    
//    var completionString: String {
//        return completion == .finish ? "완료" : "미완료"
//    }
//    var formattedStartDate: String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yy/MM/dd HH:mm"
//        return dateFormatter.string(from: startDate)
//    }
    
}

