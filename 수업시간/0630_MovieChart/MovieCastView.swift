//
//  MovieCastView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/30.
//

import SwiftUI

struct MovieCastView: View {
    
    var castData: CastInfo
    
    var body: some View {
        VStack {
            
            AsyncImage(url: castData.imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            .padding()
            
            Form {
                Text("배우명 : \(castData.castName)")
                Text("극중명 : \(castData.roleName)")
                Text("성    별 : \(castData.sex)")
                Text("✅  \(castData.leading)")
            }.font(.system(size: 20))
        }
    }
}

//struct MovieCastView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieCastView(castData: CastInfo(imageURLString: "https://search.pstatic.net/common?type=n&size=174x196&quality=100&direct=true&src=http%3A%2F%2Fsstatic.naver.net%2Fpeople%2F136%2F202207191426445191.jpg", castName: "이지훈", roleName: "양종수", sex: "남자", leadingRole: false))
//    }
//}
