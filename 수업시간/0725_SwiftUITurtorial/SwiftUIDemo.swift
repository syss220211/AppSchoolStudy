//
//  SwiftUIDemo.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/25.
//

import SwiftUI

struct PickerColor: Identifiable{
    var id: Int
    var color: Color
    var name: String
}

struct SwiftUIDemo: View {
    
    var colors: [Color] = [.black, .red, .green, .blue]
    var colornmanes: [String] = ["Black", "red", "green", "blue"]
    
    var pickColors: [PickerColor] = [
        PickerColor(id: 0, color: .blue, name: "blue"),
        PickerColor(id: 1,color: .black, name: "black"),
        PickerColor(id: 2,color: .red, name: "red"),
        PickerColor(id: 3,color: .green, name: "green")
    ]
    
    @State private var colorIndex: Int = 0
    @State private var rotation: Double = 0.0
    @State private var text: String = "Enter Text"
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("\(text)")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .rotationEffect(.degrees(rotation))
//                .rotationEffect(.radians(rotation))
//                .animation(.linear(duration: 5), value: rotation)
                .animation(.easeInOut(duration: 5), value: rotation)
                .foregroundColor(pickColors[colorIndex].color)
            
            Slider(value: $rotation, in: 0...360, step: 0.1)
            
            TextField("텍스트 입력", text: $text)
                .textFieldStyle(.roundedBorder)
            Picker(selection: $colorIndex, label: Text("Color")) {
                ForEach(pickColors) { pcikColor in
                    Text(pcikColor.name).tag(pcikColor.id)
                }
            }
            .pickerStyle(.inline)
            
            Spacer()
            
           Text("\(rotation)")
                .font(.largeTitle)
        }.padding()
    }
}

struct SwiftUIDemo_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIDemo()
    }
}
