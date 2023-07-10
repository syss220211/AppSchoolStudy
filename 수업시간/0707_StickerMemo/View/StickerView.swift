//
//  StickerView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/10.
//

import SwiftUI

struct StickerView: View {
    var stickerStore: StickerStore
    var sticker: Sticker
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(sticker.memo)
                    .font(.title3)
                    .padding()
                Text(sticker.dateString)
                    .font(.footnote)
                    .padding()
            }
            Spacer()
        }
//        .frame(maxWidth: .infinity, maxHeight: 90)
        .background(getColorType(sticker.color))
        .shadow(radius: 6)
        .padding()
        
        .contextMenu{
            ShareLink(item: sticker.memo)
            
            Button {
                stickerStore.removeSticker(sticker: sticker)
            } label: {
                Image(systemName: "trash.slash")
                Text("Remove")
            }
        }
            
    }
}

struct StickerView_Previews: PreviewProvider {
    static var previews: some View {
        StickerView(stickerStore: StickerStore(), sticker: Sticker(memo: "Hello", date: Date(), color: .blue))
    }
}
