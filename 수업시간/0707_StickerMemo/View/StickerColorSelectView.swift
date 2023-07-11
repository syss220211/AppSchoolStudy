//
//  StickerColorSelectView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/10.
//

import SwiftUI

// MARK: - 선택된 컬러에 체크박스 표시하기

struct StickerColorSelectView: View {
    
    @Binding var selectedColor: ColorType
    let color: ColorType
    
    var body: some View {
        Button {
            print("\(color.rawValue)")
            selectedColor = color
        } label: {
            ZStack {
                Rectangle()
                    .shadow(radius: 6)
                    .foregroundColor(getColorType(color))
                    .frame(maxHeight: 40)
                
                if selectedColor == color {
                    Image(systemName: "checkmark")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                }
            }
        }
    }
}

struct StickerColorSelectView_Previews: PreviewProvider {
    static var previews: some View {
        StickerColorSelectView(selectedColor: .constant(.blue), color: .cyan)
    }
}
