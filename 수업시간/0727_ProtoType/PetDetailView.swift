//
//  PetDetailView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/27.
//

import SwiftUI

struct PetDetailView: View {
    var body: some View {
        
        NavigationStack {
            List {
                NavigationLink {
                    PetDetailEditView()
                } label: {
                    HStack {
                        VStack {
                            Image("강아지")
                                .resizable()
                                .frame(width: 90, height: 90)
                                .clipShape(Circle())
                        }
                        .padding(.trailing, 10)
                        VStack(alignment: .leading, spacing: 20) {
                            Text("반려동물1")
                            Text("2022.02.11 (2살)")
                        }
                    }
                }
                NavigationLink {
                    PetDetailEditView()
                } label: {
                    HStack {
                        VStack {
                            Image("고양이")
                                .resizable()
                                .frame(width: 90, height: 90)
                                .clipShape(Circle())
                        }
                        .padding(.trailing, 10)
                        VStack(alignment: .leading, spacing: 20) {
                            Text("반려동물2")
                            Text("2020.04.27 (4살)")
                        }
                    }
                }
                .listRowSeparator(.hidden) // 구분선 지우기
            }
            .listStyle(.plain)
//            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("00님의 반려동물")
        }
    }
}

struct PetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailView()
    }
}
