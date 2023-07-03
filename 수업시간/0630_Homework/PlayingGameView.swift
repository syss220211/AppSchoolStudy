//
//  PlayingGameView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/01.
//

import SwiftUI

struct PlayingGameView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var mockData = Array(pokemonData.shuffled().prefix(3))
    @Binding var myData: [Pokemon]
    @State var result = ""
    @State var computerChoice: Pokemon? = nil
    @State var myChoice: Pokemon? = nil
    @State var resultReturn: Bool = false
    
    
    // test onChange
    @State var myChoiceName: String = ""
    @State var myChoiceType: String = ""
    @State var mockChoiceName: String = ""
    @State var mockChoiceType: String = ""
    
    // 결과 문구 테스트
    @State var finalResult: String = ""
    @State var resultView: Bool = false
    private func getComputerData() {
        
        if let pockemon = mockData.randomElement() {
            self.computerChoice = pockemon
        }
    }
    
    private func getComputerResult() -> (String, String) {

        var name: String = ""
        var choice: String = ""
        
        if let computerChoice {
            name = computerChoice.name
            choice = computerChoice.type.rawValue
        }
        return (name, choice)
    }
    
    private func getMyChoiceResult() -> (String, String) {
        var name: String = ""
        var choice: String = ""
        
        if let myChoice {

            name = myChoice.name
            choice = myChoice.type.rawValue
        }
        return (name, choice)
    }
    
    func gameRule() -> String {
        guard let myChoice, let computerChoice else { return "" }
        
        switch myChoice.type {
        case .fire:
            if computerChoice.type == .fire {
                return "비겼습니다!"
            } else if computerChoice.type == .water {
                return "이겼습니다!"
            } else if computerChoice.type == .grass {
                return "이겼습니다!"
            } else {
                return "졌습니다!"
            }
            
        case .grass:
            if computerChoice.type == .fire {
                return "졌습니다!"
            } else if computerChoice.type == .water {
                return "이겼습니다!"
            } else if computerChoice.type == .grass {
                return "비겼습니다!"
            } else {
                return "이겼습니다!"
            }
            
        case .poison:
            if computerChoice.type == .fire {
                return "졌습니다!"
            } else if computerChoice.type == .water {
                return "이겼습니다!"
            } else if computerChoice.type == .grass {
                return "이겼습니다"
            } else {
                return "비겼습니다!"
            }
            
        case .water:
            if computerChoice.type == .fire {
                return "이겼습니다!"
            } else if computerChoice.type == .water {
                return "비겼습니다!"
            } else if computerChoice.type == .grass {
                return "졌습니다!"
            } else {
                return "졌습니다!"
            }
        }
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("컴퓨터 포켓몬")
                    .font(.system(size: 25, weight: .bold))
                Text("컴퓨터의 포켓몬은 랜덤 선택됩니다!")
                    .font(.system(size: 18, weight: .semibold))
                HStack{
                    ForEach(mockData, id: \.self) { pokemon in
                        HStack {
                            Text(pokemon.name)
                            Image(systemName: pokemon.type.image)
                        }
                        .font(.system(size: 18, weight: .semibold))
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(pokemon.type.background)
                        .cornerRadius(20)
                        .foregroundColor(.white)
                    }
                }
                .padding(.bottom, 30)
                
                Text("내 포켓몬")
                    .font(.system(size: 25, weight: .bold))
                Text("대결할 포켓몬을 선택해주세요!")
                    .font(.system(size: 18, weight: .semibold))
                
                HStack {
                    ForEach(myData, id: \.self) { pokemon in
                        HStack {
                            Button {
                                self.myChoice = pokemon
                            } label: {
                                Text(pokemon.name)
                                Image(systemName: pokemon.type.image)
                                    
                            }
       
                        }
                        .foregroundColor(.white)
                        .padding(10)
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(pokemon.type.background)
                        .cornerRadius(20)
                    }
                }
            }
            
            Button {
                self.getComputerData()
                self.result = gameRule()
                self.resultReturn = true
                self.resultView = true
            } label: {
                Text("포켓몬 대결하기")
                    .font(.system(size: 20, weight: .bold))
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .foregroundColor(.white)
                    .background(.yellow)
                    .cornerRadius(20)
            }.onChange(of: resultReturn) { newValue in
                myChoiceName = getMyChoiceResult().0
                myChoiceType = getMyChoiceResult().1
                mockChoiceName = getComputerResult().0
                mockChoiceType = getComputerResult().1
                finalResult = result
                resultReturn = false
                
            }
            
            Text(finalResult)
                .font(.system(size: 30, weight: .bold))
                
            if resultView {
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("내 포켓몬")
                            Text("이름 \(myChoiceName)")
                            Text("속성 \(myChoiceType)")
                        }
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.black, lineWidth: 1))
                        
                        VStack(alignment: .leading) {
                            Text("컴퓨터 포켓몬")
                            Text("이름 \(mockChoiceName)")
                            Text("속성 \(mockChoiceType)")
                        }
                        .font(.system(size: 15, weight: .semibold))
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 30).stroke(Color.black, lineWidth: 1))
                    }
                    
                    Spacer()
                    Button {
                        myData = []
                        dismiss()
                    } label: {
                        Text("처음부터 다시하기")
                            .font(.system(size: 20, weight: .bold))
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .foregroundColor(.white)
                            .background(.red)
                            .cornerRadius(20)
                    }
                }
            }
        }.padding(20)
    }
}

struct PlayingGameView_Previews: PreviewProvider {
    static var previews: some View {
        PlayingGameView(myData: .constant([]))
    }
}
