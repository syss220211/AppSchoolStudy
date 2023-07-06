//
//  RandomMemberMainView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/06.
//

import SwiftUI

struct RandomMemberMainView: View {
    
    // 현재 RandomMemberStore는 빈배열
    @ObservedObject var memberStore: RandomMemberStore = RandomMemberStore()
    
    @State var isShowingPlus: Bool = false
    @State var isShowingAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            List(memberStore.members) { member in
                Text("\(member.name)")
            }
            
            .toolbar {
                // 데이터 추가 눌러서 sheet 위로 올라오게 만들기
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingPlus = true
                    } label: {
                        Label("데이터 추가", systemImage: "plus")
                    }
                    
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        if memberStore.members.isEmpty {
                            isShowingAlert = false
                            return
                        } else {
                            isShowingAlert = true
                        }
                        
                    } label: {
                        Label("데이터 삭제", systemImage: "minus")
                    }
                    .disabled(memberStore.members.isEmpty)
                }
            }
            .sheet(isPresented: $isShowingPlus, content: {
                RandomMemberAddView(memberStore: memberStore, isShowingPlus: $isShowingPlus)
            })
            .alert(isPresented: $isShowingAlert) {
                Alert(title: Text("전체 멤버를 삭제하시겠습니까?"), message: Text("돌이킬 수 없습니다"), primaryButton: .destructive(Text("Delete")) { memberStore.removeMembersAll()
                }, secondaryButton: .cancel())
            }
            
            NavigationLink {
                PickedMemberView(memberStore: memberStore)
            } label: {
                Label("멤버 뽑기", systemImage: "person.fill.questionmark")
                    .foregroundColor(.black)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.black, lineWidth: 1))
            }

            
            .navigationTitle("Member")
        }
    }
}

struct RandomMemberMainView_Previews: PreviewProvider {
    static var previews: some View {
        RandomMemberMainView()
    }
}
