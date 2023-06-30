


import SwiftUI

struct SchoolMainView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    AsyncImage(url: school.imageURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                Section {
                    ForEach(school.grades) { grade in
                        
                        NavigationLink {
                            GradeView(grade: grade)
                        } label: {
                            Text("\(grade.name)")
                        }
                    }
                }
            }
            .navigationTitle("\(school.name)")
        }
    }
}

struct SchoolMainView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolMainView()
    }
}
