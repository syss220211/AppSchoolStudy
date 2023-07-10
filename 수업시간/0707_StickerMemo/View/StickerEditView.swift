//
//  StickerEditView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/10.
//

import SwiftUI

struct StickerEditView: View {
    var stickerStore: StickerStore
    @Binding var sticker: Sticker
    @Binding var editState: Bool
    @State var memo: String = ""

    @State var selectedColor: ColorType

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text("select a color")
                    .font(.title)
                HStack {
                    ForEach(ColorType.allCases, id: \.self) { item in
                        StickerColorSelectView(selectedColor: $selectedColor, color: item)
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
            .navigationTitle("Edit sticker")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("수정") {
                        print(selectedColor)
                        sticker.memo = memo
                        sticker.date = Date()
                        sticker.color = selectedColor
                        stickerStore.updateSticker(sticker: sticker)
                        editState = false
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("취소") {
                        editState = false
                    }
                }

            }
        }
        .onAppear {
            memo = sticker.memo
            selectedColor = sticker.color

        }
    }
}
//
//struct StickerEditView_Previews: PreviewProvider {
//    static var previews: some View {
////        StickerEditView(stickerStore: StickerStore(), sticker: Sticker(memo: "Good", date: Date()), isShowingEditSheet: .constant(true))
//        StickerEditView(stickerStore: StickerStore(), sticker: Sticker(memo: "good", date: Date(), color: .blue), editState: .constant(true))
//    }
//}
