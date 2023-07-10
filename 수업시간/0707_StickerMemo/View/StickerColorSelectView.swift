//
//  StickerColorSelectView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/10.
//

import SwiftUI

struct StickerColorSelectView: View {
    @Binding var selectedColor: Color
    let color: Color
    
    var body: some View {
        Button {
            print("\(color)")
            selectedColor = color
        } label: {
            ZStack {
                Rectangle()
                    .shadow(radius: 6)
                    .foregroundColor(color)
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
