//
//  PickedMemberView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/06.
//

import SwiftUI

struct PickedMemberView: View {
    var memberStore: RandomMemberStore
    
    var body: some View {
        VStack {
            Text("\(memberStore.randomMember.name)")
        }
    }
}

struct PickedMemberView_Previews: PreviewProvider {
    static var previews: some View {
        PickedMemberView(memberStore: RandomMemberStore())
    }
}
