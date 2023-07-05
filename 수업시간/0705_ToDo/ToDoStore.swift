//
//  ToDoStore.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/05.
//

import SwiftUI
import Combine


class TodoStore: ObservableObject {
//    @Published var todoData: [Todo] = []
    @Published var todoData: [Todo] = [Todo(agenda: "오늘의 할일 테스트", startDate: Date(), dueDate: Date(), completion: false)]
    
    // 할일 추가
    func addTodo(id: UUID, agenda: String, dueDate: Date, completion: Bool, startDate: Date) {
        if agenda.count > 0 {
            
            let newData: Todo =  Todo(agenda: agenda, startDate: startDate, dueDate: dueDate, completion: completion)//Todo(agenda: agenda, startDate: startDate, dueDate: dueDate, completion: completion)
            todoData.append(newData)
        }
    }
    
    // MARK: - 토클 조절 버튼
    func updateTodoCompletion(todo: Todo, completion: Bool) {
            if let index = todoData.firstIndex(of: todo) {
                todoData[index].completion = completion
            }
        }
    
    
    // 할일 삭제
    func removeTodo(index: Todo) {
        todoData.removeAll { $0.id == index.id }
    }
}
