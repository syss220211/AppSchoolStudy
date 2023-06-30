//
//  GradeView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/30.
//

import SwiftUI

struct GradeView: View {
    var grade: Grade
    
    var body: some View {
        List {
            if grade.schoolClasses.count > 0 {
                ForEach(grade.schoolClasses) { schoolClass in
                    
                    NavigationLink {
                        SchoolClassView(schoolClass: schoolClass)
                    } label: {
                        Text("\(schoolClass.name)")
                    }

                }
            } else {
                Text("아직 반편성이 되지 않았습니다")
            }
        }
        .navigationTitle("\(grade.name)")
    }
}

struct GradeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            GradeView(grade: Grade(name: "1학년", schoolClasses: [
                SchoolClass(name: "1반", students: []),
                SchoolClass(name: "2반", students: []),
                SchoolClass(name: "3반", students: []),
            ]))
        }
    }
}
