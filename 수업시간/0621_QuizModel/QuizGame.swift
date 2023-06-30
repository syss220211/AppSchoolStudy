//
//  QuizGame.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/21.
//

import SwiftUI
//import AVFoundation

enum Status {
    case start
    case playing
    case end
    case nextLevel
    case finish
}

struct QuizGame: View {
    
    // 페이지 구분을 위한 열거형 추가
    @State var gameStatus: Status
    // 데이터 순서 넘어가는 변수, quizData이 배열이니까 인덱스로 사용하기 위해 변화하는 State로 선언
    @State var i: Int = 0
    
    // 점수 내는 변수
    @State var score = 0
    @State var wrongQ = 0
    
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
            self.gameStatus = .end
        } else {
            // 틀림의 점수 증가
            wrongQ = wrongQ + 1
            i = i + 1
            print("어떤걸 해줄건지 생각해보자...")
        }
    }
    
    var body: some View {
        
        switch gameStatus {
        case .start:
            VStack {
                ReuseableText(text: "환영합니다!", size: 30)
                ReuseableText(text: "게임을 시작하시겠습니까?", size: 30)
                    .padding(.bottom, 50)
                Button {
                    self.gameStatus = .playing
                } label: {
                    Text("게임 시작")
                        .fontWeight(.bold)
                        .frame(width: 360, height: 50)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        case .playing:
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
//                    self.gameStatus = .nextLevel
                }
            }
        case .end:
            VStack {
                ReuseableText(text: "Game Over!!!", size: 50)
                    .foregroundColor(.red)
                    .padding(.bottom, 50)
                ReuseableText(text: "3개를 틀려서 게임이 종료되었습니다.", size: 25)
                    .padding(.bottom, 7)
                ReuseableText(text: "다시 시작하시겠습니까?", size: 25)
                    .padding(.bottom, 70)
                
                HStack {
                    Button {
                        self.gameStatus = .finish
                    } label: {
                        Text("End Game")
                            .fontWeight(.bold)
                            .frame(width: 150, height: 50)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    Button {
                        self.gameStatus = .start
                    } label: {
                        Text("Restart Game")
                            .fontWeight(.bold)
                            .frame(width: 150, height: 50)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }

            }
        case .nextLevel:
            Text("")
        case .finish:
            ReuseableText(text: "게임이 종료되었습니다.", size: 35)
        }
    }
}

struct QuizGame_Previews: PreviewProvider {
    static var previews: some View {
        QuizGame(gameStatus: .finish)
    }
}

// extractedView 기능 사용하기
struct ReuseableText: View {
    var text: String
    var size: Int
    
    var body: some View {
        Text(text)
            .font(.system(size: CGFloat(size), weight: .bold, design: .rounded))
            .shadow(radius: 2)
    }
}
