//
//  PlayingGameView.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/01.
//

import SwiftUI

struct PlayingGameView: View {
    
    var mockData = Array(pokemonData.shuffled().prefix(3))
    @Binding var myData: [Pokemon]
    
    @State var result = ""
    
    @State var computerChoice: Pokemon? = nil
    @State var myChoice: Pokemon? = nil
    
    private func getComputerData() {
        
        if let pockemon = mockData.randomElement() {
            self.computerChoice = pockemon
        }
    }
    
    private func getComputerResult() -> String {
        
//        Text(computerChoice?.name ?? "", computerChoice?.type.rawValue)
        
        var name: String = ""
        var choice: String = ""
        
        if let computerChoice {
            
            name = computerChoice.name
            choice = computerChoice.type.rawValue
        }
        
        return name + choice
    }
    
    private func getMyChoiceResult() -> String {
        var name: String = ""
        var choice: String = ""
        
        if let myChoice {
            
            name = myChoice.name
            choice = myChoice.type.rawValue
        }
        
        return name + choice
    }
    
    func gameRule() -> String {
        
        guard let myChoice, let computerChoice else { return "" }
        
        switch myChoice.type {
        case .fire:
            if computerChoice.type == .fire {
                return "비겼습니다."
            } else if computerChoice.type == .water {
                return "이겼습니다."
            } else if computerChoice.type == .grass {
                return "이겼습니다."
            } else {
                return "졌습니다."
            }
            
        case .grass:
            if computerChoice.type == .fire {
                return "졌습니다."
            } else if computerChoice.type == .water {
                return "이겼습니다."
            } else if computerChoice.type == .grass {
                return "비겼습니다."
            } else {
                return "이겼습니다."
            }
            
        case .poison:
            if computerChoice.type == .fire {
                return "졌습니다."
            } else if computerChoice.type == .water {
                return "이겼습니다."
            } else if computerChoice.type == .grass {
                return "이겼습니다"
            } else {
                return "비겼습니다."
            }
            
        case .water:
            if computerChoice.type == .fire {
                return "이겼습니다."
            } else if computerChoice.type == .water {
                return "비겼습니다."
            } else if computerChoice.type == .grass {
                return "졌습니다."
            } else {
                return "졌습니다."
            }
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(mockData, id: \.self) { pokemon in
                    HStack {
                        Text(pokemon.name)
                        Image(systemName: pokemon.type.image)
                        
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(pokemon.type.background)
                    .cornerRadius(20)
                }
            }
            
            HStack {
                ForEach(myData, id: \.self) { pokemon in
                    HStack {
                        Button {
                            self.myChoice = pokemon
                        } label: {
                            Text(pokemon.name)
                            Image(systemName: pokemon.type.image)
                                .foregroundColor(.white)
                        }
   
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(pokemon.type.background)
                    .cornerRadius(20)
                }
            }
            
            Button {
                
                self.getComputerData()
                
                self.result = gameRule()
                
            } label: {
                Text("대결하기")
                    .padding(20)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .foregroundColor(.white)
                    .background(.blue)
                    .cornerRadius(20)
            }
            
            Text(getComputerResult())
            Text(getMyChoiceResult())
//            Text(myChoice?.name ?? "", myChoice?.type ?? "")
            
            Text(result)
        }.padding(20)
    }
}

struct PlayingGameView_Previews: PreviewProvider {
    static var previews: some View {
        PlayingGameView(myData: .constant([]))
    }
}
