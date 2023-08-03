//
//  MapKitContentView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/08/03.
//

import SwiftUI

struct MapKitContentView: View {
    
    @State private var selectedIndex = 1
    
    var body: some View {
        
        TabView(selection: $selectedIndex) {
            VStack {
                MapKitMainView(text: "red View")
                    .background(.red)
                MapKitMainView(text: "yellow View")
                    .background(.yellow)
                MapKitMainView(text: "purple View")
                    .background(.purple)
            }
            .padding()
            .tabItem{
                Text("First")
            }.tag(1)
            
            MyWebView().tabItem {
                Text("Second")
            }.tag(2)
         
            MyChartView().tabItem {
                Text("Third")
            }.tag(3)
         
        }
    }
}

struct MapKitContentView_Previews: PreviewProvider {
    static var previews: some View {
        MapKitContentView()
    }
}
