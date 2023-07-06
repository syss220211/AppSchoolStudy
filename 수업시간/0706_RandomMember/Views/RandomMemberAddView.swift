//
//  RandomMemberAddView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/06.
//

import SwiftUI

struct RandomMemberAddView: View {
    
    //앞에서 데이터 받아오기
    var memberStore: RandomMemberStore
    @Binding var isShowingPlus: Bool
    @State var name: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("이름을 입력하세요.", text: $name)
                    .textFieldStyle(.roundedBorder)
                    .font(.system(size: 20))
            }
            .padding(20)
            .navigationTitle("멤버 추가")
            .toolbar {
                // 데이터 추가 눌러서 sheet 위로 올라오게 만들기
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingPlus = false
                        memberStore.addMember(name: name)
                    } label: {
                        Text("추가")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isShowingPlus = false
                    } label: {
                        Text("취소")
                    }
                }
            }
        }
    }
}

struct RandomMemberAddView_Previews: PreviewProvider {
    static var previews: some View {
        RandomMemberAddView(memberStore: RandomMemberStore(), isShowingPlus: .constant(false))
    }
}
