//
//  test.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/29.
//

import SwiftUI

enum Nation: CaseIterable {
    
    case usd
    case jpy
    case eur
    
    var title: String {
        switch self {
        case .usd: return "미국"
        case .jpy: return "일본"
        case .eur: return "유럽"
        }
    }
    
    var color: Color {
        switch self {
        case .usd: return .blue
        case .jpy: return .red
        case .eur: return .green
        }
    }
}


struct UnusedButton: View {
    
    @State var isResetting = false
    @State var Won: String = ""
    
    @State var usd: String = ""
    @State var jpy: String = ""
    @State var eur: String = ""
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            HStack {
                Text("🇰🇷 원화")
                TextField("환전할 금액을 입력해주세요", text: $Won)
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.blue, lineWidth: 2))
            
            ForEach(Nation.allCases, id: \.self) { nation in
                
                switch nation {
                case .eur: NationView(nation: nation, won: $Won, money: $eur)
                case .jpy: NationView(nation: nation, won: $Won, money: $jpy)
                case .usd: NationView(nation: nation, won: $Won, money: $usd)
                }
            }
            
            Button {
                isResetting = true // 상태 속성 값 바꾸기 false -> true, 바꿈으로써 재설정 버튼 탭임을 나타내기
            } label: {
                Text("다시하기")
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(.red)
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .bold))
                    .cornerRadius(10)
            }
        }
        .padding(20)
        .onChange(of: isResetting) { newValue in // 상태값이 true일 때 값 설정하기
            if newValue {
                Won = ""
                usd = ""
                jpy = ""
                eur = ""
                isResetting = false
            }
        }
    }
}


struct NationView: View {
    
    @State var nation: Nation
    @Binding var won: String
    @Binding var money: String
    
    private func getChangeMoney() -> String {
        // 환전금액과 환율이 입력되었을 때 옵셔널
        guard let doubleWon = Double(won), let doubleMoney = Double(money) else {
            return ""
        }
        return String(format: "%.2f", doubleWon / doubleMoney)
    }

    var body: some View {

        VStack {
            HStack {
                Text(nation.title)
                TextField(nation.title, text: $money)
                    .font(.system(size: 13))
            }
            .padding(.all, 9)
            
            Divider()

            Text("환전 받는 돈 \(getChangeMoney())")
                .font(.system(size: 15))
                .foregroundColor(nation.color)
                .frame(alignment: .leading)
                .padding(.bottom, 10)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.black, lineWidth: 2)
        }
    }
}


struct UnusedButton_Previews: PreviewProvider {
    static var previews: some View {
        UnusedButton()
    }
}
