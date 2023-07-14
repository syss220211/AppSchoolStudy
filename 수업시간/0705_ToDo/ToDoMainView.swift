//
//  ToDoMainView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/05.
//

import SwiftUI

struct ToDoMainView: View {
    
    @ObservedObject var todoList: TodoStore = TodoStore()
    
    @State var todo: String = ""
    @State var startDate: Date = Date()
    @State var dueDate: Date = Date()
    
    var body: some View {
        NavigationStack {
            VStack {
                List(todoList.todoData) { todo in
                    VStack {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("\(todo.agenda)")
                                HStack {  
                                    Text("시작일")
                                    Text("\(todo.formattedStartDate)")
                                }
                                HStack {
                                    Text("마감일")
                                    Text("\(todo.formattedDueDate)")
                                }
                            }
                            
                            Spacer()
                            // MARK: - 연산 프로퍼티를 사용해서 토글 값을 재설정함
                            /*
                             Todo 구조체의 completion 속성이 변경 가능(var)으로 표시되지 않았기 때문에 Toggle의 isOn 매개변수에 직접 바인딩하려고 하면 실제로 오류가 발생합니다. 이 문제를 해결하려면 별도의 @State 변수를 도입하여 토글 상태를 처리하고 이에 따라 Todo 항목을 업데이트할 수 있습니다. 업데이트된 버전의 코드는 다음과 같습니다.
                             */
                            Toggle("완료", isOn: Binding(
                                get: { todo.completion }, //todo.completion의 현재 값 반환
                                set: { newValue in // 토글에서 새롭게 들어오는 값을 확인해서 그 값에 따른 값을 completion에 넣어줌
                                    todoList.updateTodoCompletion(todo: todo, completion: newValue)
                                }
                            ))
                            .labelsHidden()
                            
                        }
                        .labelsHidden()

                        Button(action: {
                            todoList.removeTodo(index: todo)
                        }) {
                            Text("삭제").foregroundColor(.red)
//                                Image(systemName: "trash").foregroundColor(.red)
                        }
                        .buttonStyle(BorderlessButtonStyle())
                        .disabled(!todo.completion)
                        
                    }.swipeActions {
                        Button("삭제"){
                            todoList.removeTodo(index: todo)
                        }.tint(Color.red)
                    }
                }
                
                // 할일 추가하기
                VStack {
                    TextField("할일을 입력하세요", text: $todo)
                    
                    DatePicker(selection: $startDate, displayedComponents: .hourAndMinute) {
                        Text("시작일")
                    }
//                    .datePickerStyle(GraphicalDatePickerStyle())
                    .environment(\.locale, Locale(identifier: "ko_KR"))
                    
                    
                    // 마감일 피커
                    DatePicker(selection: $dueDate, displayedComponents: .date) {
                        Text("마감일")
                    }
//                    .datePickerStyle(.compact)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .environment(\.locale, Locale(identifier: "ko_KR")) //한국어 설정
                    
                    
                    Button {
                        todoList.addTodo(id: UUID(), agenda: todo, dueDate: dueDate, completion: false, startDate: startDate)
                    } label: {
                        Text("할일 추가하기")
                    }
                    
                    
                }.padding()
            }
            .navigationTitle("Todo")
        }
    }
}

struct ToDoMainView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoMainView()
    }
}


struct RowButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .contentShape(Rectangle()) // Set the content shape to a rectangle
            .onTapGesture {} // Disable tap gesture on the button
    }
}


