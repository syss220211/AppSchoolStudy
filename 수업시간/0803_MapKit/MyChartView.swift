//
//  MyChartView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/08/04.
//

import SwiftUI

struct MyChartView: UIViewControllerRepresentable { // 뷰컨자체를 가져와서 사용하는 방법
    func makeUIViewController(context: Context) -> some UIViewController {
        
        return CharViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct MyChartView_Previews: PreviewProvider {
    static var previews: some View {
        MyChartView()
    }
}
