//
//  RankListView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/14.
//

import SwiftUI

struct RankListView: View {
    
    // 데이서 생성 및 초기화
    @ObservedObject var stickerStore: StickerStore = StickerStore()
    @State var rankAddState: Bool = false
//    @State var rankEditState: Bool = false
    @State var sticker: Sticker = Sticker()
    
    @ObservedObject var rankListStore: RankListStore = RankListStore()
    @State var ranker: RankList = RankList()
    
    
    var body: some View {
        NavigationStack {
            List(rankListStore.rankLists) { ranker in
                Button {
                    print("")
                } label: {
                    VStack {
                        Text(ranker.name)
                        Text("\(ranker.power)")
                    }
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
                        rankAddState = true
                    } label: {
                        Label("add", systemImage: "pencil.tip.crop.circle.badge.plus")
                    }
                }
            }
            .sheet(isPresented: $rankAddState) {
                StickerAddView(stickerStore: stickerStore, addState: $rankAddState)
            }

        }
    }
}

struct RankListView_Previews: PreviewProvider {
    static var previews: some View {
        RankListView()
    }
}
