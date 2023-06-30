//
//  MovieInfoView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/30.
//

import SwiftUI

struct MovieInfoView: View {
    
    var movieInfo: MovieInfo
    
    var body: some View {
        
        List {
            AsyncImage(url: movieInfo.imageURL) { imgae in
                imgae
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }.padding(20)
            
            ForEach(movieInfo.movieCast) { cast in
                HStack {
                    AsyncImage(url: cast.imageURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:60, height: 60)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                    }
                    
                    NavigationLink {
                        MovieCastView(castData: cast)
                    } label: {
                        Text("\(cast.castName)")
                            .font(.system(size: 20))
                            .padding()
                    }

                }
            }
        }.navigationTitle("\(movieInfo.movieTitle)")
    }
}

//struct MovieInfoView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieInfoView()
//    }
//}
