//
//  NumberGame.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/19.
//

import SwiftUI

struct NumberGame: View {

    @State private var selected = 0
    @State var answer: Int = .random(in: 0...10)

    
    init() {
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.gray], for: .normal)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("숫자를 선택해주세요")
                .font(.system(size: 30, weight: .bold))
            
            Picker(selection: $selected, label: Text("")) {
                ForEach(0..<11) {
                    Text("\($0)").tag($0)
                }
            }.pickerStyle(SegmentedPickerStyle())
                .padding()
          
            if selected == answer {
                Text("정답입니다!")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.blue)
            }
//            } else {
//                Text("오답입니다!")
//                    .font(.system(size: 20, weight: .bold))
//                    .foregroundColor(.red)
//            }
            
            Button("RESET") {
                answer = .random(in: 0...10)
            }
        }

    }
}

struct NumberGame_Previews: PreviewProvider {
    static var previews: some View {
        NumberGame()
    }
}
