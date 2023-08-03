//
//  PetDetailEditView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/27.
//

import SwiftUI

struct PetDetailEditView: View {
    var body: some View {
        NavigationStack {
            Image("PetDetailEdit")
                .resizable() // Make the image resizable
                .frame(width: 363, height:650)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("반려동물1 정보 수정")
        }
    }
}

struct PetDetailEditView_Previews: PreviewProvider {
    static var previews: some View {
        PetDetailEditView()
    }
}
