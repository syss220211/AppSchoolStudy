//
//  backupview.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/29.
//

import SwiftUI

struct backupview: View {
    
    // 리셋 버튼 추가
    @State var isResetting = false
    
    // 입력받는 한국돈
    @State var Won: String = ""
    
    // 나라별로 입력받는 환률
    @State var USD: String = "" // 미국
    @State var JPY: String = "" // 일본
    @State var EUR: String = "" // 유럽
    
    // 환전 계산 된 돈
    @State var changedUsd: String = "?"
    @State var changedJPY: String = "?"
    @State var changedEUR: String = "?"
    
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Text("🇺🇸 달러")
                    TextField("오늘의 미국 환율을 입력해주세요", text: $USD).font(.system(size: 13))
                }
                .padding(.all, 9)
                Divider()

                Text("환전 가능한 달러는 \(changedUsd) 달러입니다.")
                    .font(.system(size: 15))
//                    .foregroundColor(Colors.USDColor)
                    .frame(alignment: .leading)
                    .padding(.all, 9)
            }.overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black, lineWidth: 2))
            
            // MARK: - 엔화
            VStack {
                HStack {
                    Text("🇯🇵 엔화")
                    TextField("오늘의 일본 환율을 입력해주세요", text: $JPY).font(.system(size: 13))
                }
                .padding(.all, 9)
                Divider()
                Text("환전 가능한 엔화는 \(changedJPY) 엔입니다.")
                    .font(.system(size: 15))
                    .frame(alignment: .leading)
//                    .foregroundColor(Colors.JPYColor)
                    .padding(.all, 9)
            }.overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black, lineWidth: 2))
            
            // MARK: - 유로
            VStack {
                HStack {
                    Text("🇪🇺 유로")
                    TextField("오늘의 유럽 환율을 입력해주세요", text: $EUR).font(.system(size: 13))
                }
                .padding(.all, 9)
                Divider()
                
                Text("환전 가능한 유로는 \(changedEUR) 유로입니다.")
                    .font(.system(size: 15))
                    .frame(alignment: .leading)
//                    .foregroundColor(Colors.EURColor)
                    .padding(.all, 9)
                    
            }
            .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.black, lineWidth: 2))
            .padding(.bottom, 100)
            
        }
    }
}

struct backupview_Previews: PreviewProvider {
    static var previews: some View {
        backupview()
    }
}
