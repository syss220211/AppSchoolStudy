//
//  SafariView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/08/04.
//

import SwiftUI

struct SafariView: View {
    @State private var isShowingSheet: Bool = false
    
    var body: some View {
        VStack {
            Button {
                isShowingSheet.toggle()
            } label: {
                Text("Show Safari View")
            }
        }
        .sheet(isPresented: $isShowingSheet) {
            MySafariView()
            
        }
    }
}

struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView()
    }
}
