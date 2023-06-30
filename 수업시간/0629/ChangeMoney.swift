//
//  ChangMoney.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/29.
//

import SwiftUI

enum Colors {
    static let USDColor: Color = .blue
    static let JPYColor: Color = .red
    static let EURColor: Color = .green
}

struct ChangeMoney: View {
    
    // 리셋 버튼 추가
    @State var isResetting = false
    
    // 입력받는 한국돈
    @State var Won: String = ""
    
    // 나라별로 입력받는 환률
    @State var USD: String = "" // 미국
    @State var JPY: String = "" // 일본
    @State var EUR: String = "" // 유럽
    
    // 환전 계산이 완료된 돈
    @State var changedUsd: String = "?"
    @State var changedJPY: String = "?"
    @State var changedEUR: String = "?"
    
    // 가능 조건
    func isValid(valueCount: String) -> Bool {
        return !valueCount.isEmpty
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("🇰🇷 원화")
                TextField("환전할 금액을 입력해주세요", text: $Won)
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.blue, lineWidth: 2))
            
            Spacer()
            MoneyCell(nation: "🇺🇸 달러", placeholder: "오늘의 미국 환율을 입력해주세요", result: "환전 가능한 달러는 \(changedUsd) 달러입니다.", colorTest: Colors.USDColor, enteredMoney: $USD)
            MoneyCell(nation: "🇯🇵 엔화", placeholder: "오늘의 일본 환율을 입력해주세요", result: "환전 가능한 엔화는 \(changedJPY) 엔화입니다.", colorTest: Colors.JPYColor, enteredMoney: $JPY)
            MoneyCell(nation: "🇪🇺 유로", placeholder: "오늘의 유럽 환율을 입력해주세요", result: "환전 가능한 유로는 \(changedEUR) 유로입니다.", colorTest: Colors.EURColor, enteredMoney: $EUR)
            Spacer()
            
            // 계산 버튼
            Button {
                if !Won.isEmpty && isValid(valueCount: USD) { self.changedUsd = String(format: "%.2f", Double(Won)! / Double(USD)!) }
                if !Won.isEmpty && isValid(valueCount: JPY) { self.changedJPY = String(format: "%.2f", Double(Won)! / Double(JPY)!) }
                if !Won.isEmpty && isValid(valueCount: EUR) { self.changedEUR = String(format: "%.2f", Double(Won)! / Double(EUR)!) }
            } label: {
                Text("환전하기")
                    .padding(.all, 5)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(.blue)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
                    .cornerRadius(10)
            }
            
            // 초기화 버튼
            Button {
                isResetting = true // 상태 속성 값 바꾸기 false -> true, 바꿈으로써 재설정 버튼 탭임을 나타내기
            } label: {
                Text("다시하기")
                    .padding(.all, 5)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(.red)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
                    .cornerRadius(10)
            }
            
        }
        .padding(20) // 전제 주변에 여백주기
        .onChange(of: isResetting) { newValue in // 상태값이 true일 때 값 설정하기
            Won = ""
            USD = ""
            JPY = ""
            EUR = ""
            changedUsd = "?"
            changedJPY = "?"
            changedEUR = "?"
            isResetting = false
        }
    }
}

struct ChangMoney_Previews: PreviewProvider {
    static var previews: some View {
        ChangeMoney()
    }
}
