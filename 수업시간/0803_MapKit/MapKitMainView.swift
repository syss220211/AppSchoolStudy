//
//  MapKitMainView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/08/03.
//

import SwiftUI

struct MapKitMainView: UIViewRepresentable {
    
    var text: String
    
    func makeUIView(context: Context) -> some UIView {
        let label: UILabel = UILabel()
        label.text = "Hello, World"
        label.textAlignment = .center
//        label.backgroundColor = .blue
        return label
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // 필요한 업데이트 작업 수행
    }
}

struct MapKitMainView_Previews: PreviewProvider {
    static var previews: some View {
        MapKitMainView(text: "Hello World!")
    }
}
