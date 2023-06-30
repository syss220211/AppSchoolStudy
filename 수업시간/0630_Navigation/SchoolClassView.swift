//
//  SchoolClassView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/30.
//

import SwiftUI

struct SchoolClassView: View {
    var schoolClass: SchoolClass
    
    var body: some View {
        List {
            if schoolClass.students.count > 0 {
                ForEach(schoolClass.students) { student in
                    HStack {
                        AsyncImage(url: student.imageURL) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                        } placeholder: {
                            ProgressView()
                        }
                        
                        NavigationLink {
                            StudentView(student: student)
                        } label: {
                            Text("\(student.name)")
                                .font(.title)
                                .padding()
                        }
                    }
                }
            } else {
                Text("아직 학생이 없습니다")
            }
        }
        .navigationTitle("\(schoolClass.name)")
    }
}

struct SchoolClassView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SchoolClassView(schoolClass: SchoolClass(name: "1반", students: [
                Student(name: "홍길동", nickanme: "호형호제", mbti: "ENFJ", imageURLString: "https://flexible.img.hani.co.kr/flexible/normal/290/206/imgdb/resize/2010/0712/1278390342_8000500986_20100712.JPG", likeDump: true, likeMintCho: false),
                    
                Student(name: "고길동", nickanme: "어르신", mbti: "ENFJ", imageURLString: "https://i.ytimg.com/vi/nKms4hBW6hQ/maxresdefault.jpg", likeDump: true, likeMintCho: false),
            ]))
        }
    }
}
