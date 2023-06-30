//
//  QuizModel.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/21.
//

import Foundation
import SwiftUI

struct QuizModel {
    var image: String?
    var question: String?
    var answerSample: [String]
    var answer: String
}


var quizData: [QuizModel] = [
    QuizModel(question: "사과는 영어로 어떤 것일까요?", answerSample: ["apple", "orange", "lemon", "melon"], answer: "apple"),
    QuizModel(question: "3 X 5 는?", answerSample: ["11", "16", "15", "20"], answer: "15"),
    QuizModel(question: "형용사가 아닌 것을 선택하세요", answerSample: ["뽀득뽀득", "사뿐사뿐", "설렘", "몽글몽글"], answer: "설렘"),
    QuizModel(question: "비는 영어로?", answerSample: ["Sunny", "Cloud", "Windy", "Rain"], answer: "Rainy"),
    QuizModel(question: "10의 배수가 아닌 것을 고르시요", answerSample: ["55", "10", "40", "20"], answer: "55"),
    QuizModel(image: "르세라핌", question: "다음 앨범을 부른 가수의 멤버가 아닌 것은?", answerSample: ["김채원", "조유리", "홍은채", "사쿠라"], answer: "조유리"),
    QuizModel(image: "아이브", question: "다음 앨범의 타이틀 곡은?", answerSample: ["I AM", "LOVE DIVE", "ELEVEN", "After Like"], answer: "I AM"),
    QuizModel(image: "에스파", question: "다음 앨범을 부른 가수는?", answerSample: ["뉴진스", "엔믹스", "프로미스나인", "에스파"], answer: "에스파"),
    QuizModel(question: "미국의 도시가 아닌것은?", answerSample: ["시카고", "피닉스", "슬라우", "휴스턴"], answer: "슬라우")
]


