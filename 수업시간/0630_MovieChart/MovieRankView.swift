//
//  MovieTypeView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/30.
//

import SwiftUI

struct MovieRankView: View {

    var rank: Rank
    
    var body: some View {
        VStack {
            Text("영화 소개")
                .font(.title)
            Text("\(rank.movieDescription)")
                .padding(20)
            
            ForEach(rank.movieInfo) { rank in
                NavigationLink {
                    MovieInfoView(movieInfo: rank)
                } label: {
                    Text("\(rank.movieTitle) 출연진 확인하기")
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(20)
                        
                }
            }
        }.padding(.bottom, 300)
    }
}

//struct MovieInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieInfoView(movieInfo: MovieInfo(imageURLString: "https://search.pstatic.net/common/?src=http%3A%2F%2Fimgnews.naver.net%2Fimage%2F5575%2F2023%2F05%2F03%2F0000375564_001_20230503080602366.jpg&type=sc960_832", movieTitle: "범죄도시", movieCast: [CastInfo(imageURLString: "https://search.pstatic.net/common?type=n&size=174x196&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2Fportrait%2F202012%2F20201207192857469.jpg", castName: "마동석", roleName: "마석도", sex: "남자", leadingRole: true)]))
//    }
//}
