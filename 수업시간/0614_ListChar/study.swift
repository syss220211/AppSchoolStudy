//
//  study.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/06/15.
//

import SwiftUI
import AVFoundation

struct study: View {
    var body: some View {
        let speechSynth = AVSpeechSynthesizer()
    
        VStack {
            Label("Charts", systemImage: "music.note.house.fill")
                .foregroundColor(.black)
                .font(.largeTitle)
            List(musics) { index in
                Button {
                    let utterance = AVSpeechUtterance(string: "\(index.title), \(index.artist)")
                    speechSynth.speak(utterance)
                } label: {
                    VStack {
                        Image("\(index.albumPhoto)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        HStack {
                            Text("\(index.title)")
                                .font(.title)
                            Spacer()
                            Text("\(index.artist)")
                                .font(.headline)
                        }
                    }
                    .padding()
                }
                .foregroundColor(.black)

                
                
            }
            .listStyle(.automatic)
        }
    }
}

struct study_Previews: PreviewProvider {
    static var previews: some View {
        study()
    }
}
