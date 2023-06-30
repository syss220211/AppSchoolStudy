//
//  SchoolData.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/30.
//

import Foundation

protocol ImageURL {
    var imageURLString: String { get set }
    var imageURL: URL { get }
}

struct School: ImageURL {
    var name: String
    var imageURLString: String

    var imageURL: URL {
        get {
            return URL(string: imageURLString)!
        }
    }

    var grades: [Grade]
}

struct Grade: Identifiable {
    var id: UUID = UUID()
    var name: String
    var schoolClasses: [SchoolClass]
}

struct SchoolClass: Identifiable {
    var id: UUID = UUID()
    var name: String
    var students: [Student]
}

struct Student: Identifiable, ImageURL {
    var id: UUID = UUID()
    var name: String
    var nickanme: String
    var mbti: String

    var imageURLString: String

    var imageURL: URL {
        get {
            return URL(string: imageURLString)!
        }
    }

    var likeDump: Bool // 부먹인가?
    var likeMintCho: Bool // 민초단인가?

    var linkDumpString: String {
        get {
            if likeDump {
                return "부먹"
            } else {
                return "찍먹"
            }
        }
    }

    var likeMintChoString: String {
        likeMintCho ? "민초단" : "반민초단"
    }
}

let school: School = School(
    name: "멋사중학교",
    imageURLString: "https://blog.kakaocdn.net/dn/GTZ4u/btr49S5dc7c/LBeRJ93ZImtgPCtvTqbC3k/img.png",
    grades: [
        Grade(name: "1학년", schoolClasses: [
            SchoolClass(name: "1반", students: [
                Student(name: "홍길동", nickanme: "호형호제", mbti: "ENFJ", imageURLString: "https://flexible.img.hani.co.kr/flexible/normal/290/206/imgdb/resize/2010/0712/1278390342_8000500986_20100712.JPG", likeDump: true, likeMintCho: false),

                Student(name: "고길동", nickanme: "어르신", mbti: "ENFJ", imageURLString: "https://i.ytimg.com/vi/nKms4hBW6hQ/maxresdefault.jpg", likeDump: true, likeMintCho: false),
            ]),
            SchoolClass(name: "2반", students: [
                Student(name: "둘리", nickanme: "초능력 내친구", mbti: "ENTP", imageURLString: "https://img.khan.co.kr/news/2010/02/01/3-2.jpg", likeDump: true, likeMintCho: false),
                Student(name: "장녹수", nickanme: "인성파탄", mbti: "INTJ", imageURLString: "https://thumb.mtstarnews.com/06/2005/11/2005110410465501099_1.jpg/dims/optimize", likeDump: false
                        , likeMintCho: true),
            ]),
            SchoolClass(name: "3반", students: []),
        ]),
        Grade(name: "2학년", schoolClasses: []),
        Grade(name: "3학년", schoolClasses: [])
])
