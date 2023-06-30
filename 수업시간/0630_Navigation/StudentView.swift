//
//  SwiftUIView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/30.
//

import SwiftUI

struct StudentView: View {
    var student: Student
    
    var body: some View {
        List {
            AsyncImage(url: student.imageURL) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
            }
            
            Text("\(student.nickanme)")
            Text("\(student.mbti)")
            
            Text("\(student.linkDumpString)")
            Text("\(student.likeMintChoString)")
        }
        .navigationTitle("\(student.name)")
    }
}

struct StudentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            StudentView(student: Student(name: "고길동", nickanme: "어르신", mbti: "ENFJ", imageURLString: "https://i.ytimg.com/vi/nKms4hBW6hQ/maxresdefault.jpg", likeDump: true, likeMintCho: false))
        }
    }
}
