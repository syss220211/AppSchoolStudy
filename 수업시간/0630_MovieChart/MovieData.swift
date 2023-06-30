//
//  MovieData.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/30.
//

import Foundation

protocol ImageSet { // 이미지 url을 받아서 url 구조체 만드는 프로토콜 구현해놓기
    var imageURLString: String { get set }
    var imageURL: URL { get }
}

struct Movie: ImageSet {
    var imageURLString: String // 영화임을 드러내는 이미지
    var imageURL: URL { // 영화이미지 url 가져오기
        return URL(string: imageURLString)!
    }
    
    var rank: [Rank] // Rank 1위/2위/3위로 들어가도록 만들기
}

struct Rank: Identifiable {
    var id: UUID = UUID()
    var rank: String // 순위
    var movieDescription: String // 영화 설명
    
    var movieInfo: [MovieInfo]
}


struct MovieInfo: Identifiable, ImageSet {
    // 영화 이미지 받아오기~~~!
    var imageURLString: String
    var imageURL: URL{
        return URL(string: imageURLString)!
    }
    
    var id: UUID = UUID()
    var movieTitle: String
    var movieCast: [CastInfo]
}

struct CastInfo: Identifiable, ImageSet {
    // 배우 이미지 가져오기
    var imageURLString: String
    var imageURL: URL {
        return URL(string: imageURLString)!
    }
    
    var id: UUID = UUID()
    var castName: String
    var roleName: String
    var sex: String
    
    // 주연 조연
    var leadingRole: Bool
    
    var leading: String {
        leadingRole ? "주연" : "조연"
    }
}

let movieData: Movie = Movie(
    imageURLString: "https://play-lh.googleusercontent.com/0oH3J4rY4gf5pILGT_zNMRkdj78UK5lwrP9AxC3_wJ_goNEHmZlAwxAX3JS-7wEUuo8",
    rank: [
        Rank(rank: "1위",
             movieDescription: "대체불가 괴물형사 마석도, 서울 광수대로 발탁! 베트남 납치 살해범 검거 후 7년 뒤, ‘마석도’(마동석)는 새로운 팀원들과 함께 살인사건을 조사한다. 사건 조사 중, ‘마석도’는 신종 마약 사건이 연루되었음을 알게 되고 수사를 확대한다. 한편, 마약 사건의 배후인 '주성철'(이준혁)은 계속해서 판을 키워가고 약을 유통하던 일본 조직과 '리키'(아오키 무네타카)까지 한국에 들어오며 사건의 규모는 점점 더 커져가는데... 나쁜 놈들 잡는 데 이유 없고 제한 없다. 커진 판도 시원하게 싹 쓸어버린다!",
             movieInfo: [
            MovieInfo(imageURLString: "https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F5575%2F2023%2F05%2F03%2F0000375564_001_20230503080602366.jpg&type=sc960_832", movieTitle: "범죄도시", movieCast: [
                CastInfo(imageURLString: "https://search.pstatic.net/common?type=n&size=174x196&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F202012%2F20201207192857469.jpg", castName: "마동석", roleName: "마석도", sex: "남자", leadingRole: true),
                CastInfo(imageURLString: "https://search.pstatic.net/common?type=n&size=174x196&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F201803%2F20180319163932358.jpg", castName: "김민재", roleName: "김만재", sex: "남자", leadingRole: false),
                CastInfo(imageURLString: "https://search.pstatic.net/common?type=n&size=174x196&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2F38%2F201910171046038731.png", castName: "이준혁", roleName: "주성철", sex: "남자", leadingRole: true),
                CastInfo(imageURLString: "https://search.pstatic.net/common?type=n&size=174x196&quality=100&direct=true&src=https%3A%2F%2Fssl.pstatic.net%2Fimgmovie%2Fmdi%2Fpi%2F000001078%2FPM107874_144935_000.jpg", castName: "아오키 무네타카", roleName: "라키", sex: "남자", leadingRole: true),
                CastInfo(imageURLString: "https://search.pstatic.net/common?type=n&size=174x196&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F202206%2F20220630100243134.jpg", castName: "이범수", roleName: "장태수", sex: "남자", leadingRole: false),
                CastInfo(imageURLString: "https://search.pstatic.net/common?type=n&size=174x196&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2F136%2F202207191426445191.jpg", castName: "이지훈", roleName: "양종수", sex: "남자", leadingRole: false)
            ])
        ]),
        Rank(rank: "2위",
             movieDescription: "불, 물, 공기, 흙 4개의 원소들이 살고 있는 ‘엘리멘트 시티’ 재치 있고 불처럼 열정 넘치는 ‘앰버'는 어느 날 우연히 유쾌하고 감성적이며 물 흐르듯 사는 '웨이드'를 만나 특별한 우정을 쌓으며, 지금껏 믿어온 모든 것들이 흔들리는 새로운 경험을 하게 되는데... 웰컴 투 ‘엘리멘트 시티’!",
             movieInfo: [
            MovieInfo(imageURLString: "https://search.pstatic.net/common?quality=75&direct=true&src=https%3A%2F%2Fmovie-phinf.pstatic.net%2F20230526_154%2F1685060493223yFUCL_JPEG%2Fmovie_image.jpg", movieTitle: "엘리멘탈", movieCast: [
                CastInfo(imageURLString: "https://search.pstatic.net/common?type=n&size=174x196&quality=100&direct=true&src=https%3A%2F%2Fssl.pstatic.net%2Fimgmovie%2Fmdi%2Fpi%2F000004381%2FPM438151_104928_000.jpg", castName: "레아 루이스", roleName: "성우", sex: "여자", leadingRole: true),
                CastInfo(imageURLString: "https://search.pstatic.net/common?type=n&size=174x196&quality=100&direct=true&src=https%3A%2F%2Fssl.pstatic.net%2Fimgmovie%2Fmdi%2Fpi%2F000003952%2FPM395272_140438_000.jpg", castName: "마무두 아티", roleName: "성우", sex: "남자", leadingRole: true)
            ])
        ])
    ])
