//
//  SwiftUIView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/30.
//

import SwiftUI

struct MovieMainView: View {
    let mainData = movieData
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    AsyncImage(url: mainData.imageURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                Section {
                    Text("실시간 영화 정보 확인하기 ⭐️")
                        .font(.system(size: 20, weight: .bold))
                        
                    ForEach(mainData.rank) { rank in
                        NavigationLink {
                            MovieRankView(rank: rank)
                        } label: {
                            Text("\(rank.rank)")
                        }
                    }
                }
            }.navigationTitle("영화 차트")
        }
    }
}

struct MovieMainView_Previews: PreviewProvider {
    static var previews: some View {
        MovieMainView()
    }
}
