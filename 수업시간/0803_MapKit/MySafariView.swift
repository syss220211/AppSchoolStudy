//
//  MySafariView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/08/04.
//

import SwiftUI
import SafariServices

struct MySafariView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let safariViewController = SFSafariViewController(url: URL(string: "https://www.youtube.com/")!)
        return safariViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

struct MySafariView_Previews: PreviewProvider {
    static var previews: some View {
        MySafariView()
    }
}
