//
//  StickerMainView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/10.
//

import SwiftUI

struct StickerMainView: View {
    var body: some View {
        NavigationStack {
            StickerListView()
        }
    }
}

struct StickerMainView_Previews: PreviewProvider {
    static var previews: some View {
        StickerMainView()
    }
}
