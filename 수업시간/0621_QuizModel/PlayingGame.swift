//
//  PlayingGame.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/22.
//

import SwiftUI

struct PlayingGame: View {
    
    // 데이터 순서 넘어가는 변수, quizData이 배열이니까 인덱스로 사용하기 위해 변화하는 State로 선언
    @State var i: Int = 0
    
    // 점수 내는 변수
    @State var score = 0
    @State var wrongQ = 0

    var body: some View {
        VStack {
            if(i < quizData.count) {
                ReuseableText(text: "맞춘 문제 : \(score)개", size: 20)
                    .foregroundColor(.blue)
                ReuseableText(text: "틀린 문제 : \(wrongQ)개", size: 20)
                    .foregroundColor(.red)
                    .padding(.bottom, 20)
                ReuseableText(text: "Quiz!", size: 35)
                
                ReuseableText(text: quizData[i].question!, size: 25)
                    .lineLimit(3)
                    .frame(width: UIScreen.main.bounds.size.width - 20, height: 60, alignment:  .center)
                    .padding(.bottom, 10)
                
                Image(quizData[i].image ?? "")
                    .resizable()
                    .frame(width: 100, height: 100)
                
                ForEach(quizData[i].answerSample, id: \.self) { index in
                    HStack {
                        Button {
                            buttonAction(choice: index, falseAnswer: wrongQ)
                        } label: {
                            Text(index)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .frame(width: 360, height: 55)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }.padding(.bottom, 15)
                }
            } else { // 퀴즈 문제가 끝났을 경우
                FinalView(score: score, WrongScore: wrongQ)
            }
        }
    }
    
    // 정답을 판별하는 함수
    func buttonAction(choice: String, falseAnswer: Int) {
        if(quizData[i].answer == choice) {
            // 맞춤의 점수 증가
            score = score + 1
            i = i + 1
        } else if(falseAnswer >= 3) {
            i = 0
            score = 0
            wrongQ = 0
//            self.gameStatus = .start
        } else {
            // 틀림의 점수 증가
            wrongQ = wrongQ + 1
            i = i + 1
            print("어떤걸 해줄건지 생각해보자...")
        }
    }
}

struct PlayingGame_Previews: PreviewProvider {
    static var previews: some View {
        PlayingGame()
    }
}
