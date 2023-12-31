//
//  MyWebView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/08/03.
//

import SwiftUI
import WebKit

struct MyWebView: UIViewRepresentable { // uikit 코드들을 가져와서 사용하는 방법
    func makeUIView(context: Context) -> some UIView {
        let webView: WKWebView = WKWebView()
        
        if let url = URL(string: "https://www.youtube.com/") {
            webView.load(URLRequest(url: url))
        }
        
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        MyWebView()
    }
}
