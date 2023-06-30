//
//  CircleImage.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/14.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("르세라핌")
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.gray, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
