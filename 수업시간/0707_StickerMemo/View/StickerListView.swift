//
//  StickerListView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/10.
//

import SwiftUI

struct StickerListView: View {
    
    // 데이서 생성 및 초기화
    @ObservedObject var stickerStore: StickerStore = StickerStore()
    @State var addState: Bool = false
    @State var editState: Bool = false
    @State var sticker: Sticker = Sticker()
    
    var body: some View {
        NavigationStack {

            List(stickerStore.stickers) { sticker in
                Button {
                    self.sticker = sticker
                    editState = true
                } label: {
                    StickerView(stickerStore: stickerStore, sticker: sticker)
                }
                .swipeActions {
                    Button("삭제"){
                        stickerStore.removeSticker(sticker: sticker)
                    }.tint(Color.red)
                }
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
                StickerAddView(stickerStore: stickerStore, addState: $addState)
            }
            .sheet(isPresented: $editState) {
                StickerEditView(stickerStore: stickerStore, sticker: $sticker, editState: $editState, selectedColor: sticker.color)
            }
            .refreshable {
                stickerStore.fetchStickers()
            }
            .onAppear {
                stickerStore.fetchStickers()
                
            }
        }
    }
}

struct StickerListView_Previews: PreviewProvider {
    static var previews: some View {
        StickerListView()
    }
}
