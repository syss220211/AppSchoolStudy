//
//  StickerListView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/10.
//

import SwiftUI

struct StickerListView: View {
    
    // 데이서 생성 및 초기화
    @ObservedObject var stikerStore: StickerStore = StickerStore()
    @State var addState: Bool = false
    var body: some View {
        NavigationStack {
            List(stikerStore.stickers) { sticker in
                StickerView(stickerStore: stikerStore, sticker: sticker)
                
            }
            .listStyle(.plain)
            .navigationTitle("Sticker")
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        addState = true
                    } label: {
                        Label("add", systemImage: "pencil.tip.crop.circle.badge.plus")
                    }
                }
            }
            .sheet(isPresented: $addState) {
                StickerAddView(stickerStore: stikerStore, addState: $addState)
            }
        }
    }
}

struct StickerListView_Previews: PreviewProvider {
    static var previews: some View {
        StickerListView()
    }
}
