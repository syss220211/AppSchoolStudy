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
            ZStack {
                Image("theaterImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .edgesIgnoringSafeArea(.all)

                    VStack {
                        Text("🎥 실시간 영화 정보 확인하기")
                            .font(.system(size: 25, weight: .semibold))
                            .foregroundColor(.white)
                            .padding(.bottom, 150)
                        
                            ForEach(mainData.rank) { rank in
                                NavigationLink {
                                    MovieRankView(rank: rank)
                                } label: {
                                    Text("\(rank.rank)")
                                        .font(.system(size: 20, weight: .semibold))
                                        .frame(width: 280, height: 30)
                                        .padding(.all, 10)
                                        .foregroundColor(.white)
                                        .background(Color.blue)
                                        .cornerRadius(10)
                                        .padding(.bottom, 10)
                                }
                            }
                    }
            }
        }
    }
}

struct MovieMainView_Previews: PreviewProvider {
    static var previews: some View {
        MovieMainView()
    }
}
