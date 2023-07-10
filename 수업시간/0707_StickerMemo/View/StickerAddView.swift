//
//  StickerAddView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/10.
//

import SwiftUI

struct StickerAddView: View {
    var stickerStore: StickerStore
    @Binding var addState: Bool
    @State var selectedColor: Color = .cyan
    @State var memo: String = ""
    
    let colors: [Color] = [.cyan, .purple, .blue, .yellow, .brown]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("select a color")
                    .font(.title)
                HStack {
                    ForEach(colors, id: \.self) { color in
                        StickerColorSelectView(selectedColor: $selectedColor, color: color)
                    }
                }
                .padding()
                
                Divider()
                
                Text("wirte a memo")
                    .font(.title)
                
                TextField("메모를 입력하세요.", text: $memo, axis: .vertical)
                    .font(.title2)
                
                Spacer()
            }
            .padding(20)
            .listStyle(.plain)
            .navigationTitle("add a sticker")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("추가") {
                        stickerStore.addSticker(memo: memo, color: selectedColor)
                        addState = false
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("취소") {
                        addState = false
                    }
                }
            }
        }
    }
}

struct StickerAddView_Previews: PreviewProvider {
    static var previews: some View {
        StickerAddView(stickerStore: StickerStore(), addState: .constant(true))
    }
}
