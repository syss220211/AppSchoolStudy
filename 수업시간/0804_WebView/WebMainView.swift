//
//  WebMainView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/08/04.
//

import SwiftUI
import SafariServices

struct Bookmark: Identifiable {
    var id: UUID = UUID()
    var title: String
    var urlString: String
    
}

class BookmarkStore: ObservableObject {
    @Published var bookmarks: [Bookmark] = []
    
    init() {
        bookmarks = [
            Bookmark(title: "Naver", urlString: "https://www.naver.com/"),
            Bookmark(title: "Google", urlString: "https://www.google.co.kr/?hl=ko"),
            Bookmark(title: "YouTube", urlString: "https://www.youtube.com/"),
            Bookmark(title: "ChatGPT", urlString: "https://openai.com/blog/chatgpt"),
            Bookmark(title: "GitHub", urlString: "https://github.com/syss220211"),
        ]
    }
    
    func addBookmark(bookmark: Bookmark) {
        bookmarks.append(bookmark)
    }
    
    func removeBookmark(at offsets: IndexSet) {
        bookmarks.remove(atOffsets: offsets)
    }
}

struct WebMainView: View {
    
    @ObservedObject var bookmarkStore = BookmarkStore()
    @State var isShowingAdding: Bool = false
    @State var isShowingWebsite: Bool = false
    @State var selectedBookmark: Bookmark?// = nil
    
    var body: some View {
        NavigationStack {
            List {
                // onDelete를 위한 ForEach 사용
                ForEach(bookmarkStore.bookmarks) { bookmark in
                    Button {
                        selectedBookmark = bookmark
                        isShowingWebsite.toggle()
                    } label: {
                        Text("\(bookmark.title)")
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .onDelete { indexSet in
                    bookmarkStore.removeBookmark(at: indexSet)
                }
            }
            .navigationTitle("Bookmarks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingAdding.toggle()
                    } label: {
                        Text("Add")
                    }

                }
            }
        }
        .sheet(item: $selectedBookmark) { bookmark in
            SafariBookView(bookmark: bookmark)
                .presentationDetents([.large, .medium])
        }
        .sheet(isPresented: $isShowingAdding) {
            AddingBookmarkView(bookmarkStore: bookmarkStore, isShowingAdding: $isShowingAdding)
        }
    }
}


struct AddingBookmarkView: View {
    
    var bookmarkStore: BookmarkStore
    @Binding var isShowingAdding: Bool
    @State private var title: String = ""
    @State private var urlString: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextField("URL", text: $urlString)
                    .keyboardType(.URL)
            }
            .navigationTitle("Add new bookmark")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        isShowingAdding.toggle()
                    } label: {
                        Text("Cancel")
                    }

                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        let newBookmark = Bookmark(title: title, urlString: urlString)
                        bookmarkStore.addBookmark(bookmark: newBookmark)
                        isShowingAdding.toggle()
                    } label: {
                        Text("Submit")
                    }
                }
            }
        }
    }
}

struct WebMainView_Previews: PreviewProvider {
    static var previews: some View {
        WebMainView()
    }
}


struct SafariBookView: UIViewControllerRepresentable {
    
    var bookmark: Bookmark

    func makeUIViewController(context: Context) -> some UIViewController {
        // URL(string: "https://www.youtube.com/")
        return SFSafariViewController(url: URL(string: bookmark.urlString)!)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
