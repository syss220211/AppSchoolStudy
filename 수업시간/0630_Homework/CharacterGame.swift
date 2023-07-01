//
//  CharacterGame.swift
//  AppSchoolStudy
//
//  Created by 박서연 on 2023/07/01.
//

import SwiftUI

 extension PokeType {
    
    var image: String {
        switch self {
        case .water:
            return "drop.fill"
        case .fire:
            return "flame.fill"
        case .poison:
            return "allergens.fill"
        case .grass:
            return "leaf.fill"
        }
    }
    
    var background: Color {
        switch self {
        case .water:
            return .blue
        case .fire:
            return .red
        case .poison:
            return .purple
        case .grass:
            return .green
        }
    }
}


struct CharacterGame: View {
    
    @State var name: String = ""
    @State var type: PokeType = .fire
    
    @State var pokemons: [Pokemon] = []
    
    var body: some View {
        
        NavigationStack {
        
            VStack {
                
                VStack(alignment: .leading) {
                    
                    Text("캐릭터 이름을 입력해주세요.")
                        .font(.system(size: 25, weight: .bold))
                    
                    TextField("캐릭터 이름 입력", text: $name)
                        .font(.system(size: 22))
                    
                    Divider()
                }
               
                VStack(alignment: .leading) {
                    
                    Text("속성 선택")
                        .font(.system(size: 25, weight: .bold))
                    
                    HStack {
                        
                        Button {
                            type = .water
                            
                        } label: {
                            Text("물")
                                .font(.system(size: 20, weight: .semibold))
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .foregroundColor(type == .water ? .white : .black)
                                .background(type == .water ? Color.blue : Color.white)
                                .cornerRadius(15)
                                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                        }
                        
                        
                        Button {
                            type = .fire
                            
                        } label: {
                            
                            Text("불")
                                .font(.system(size: 20, weight: .semibold))
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .foregroundColor(type == .fire ? .white : .black)
                                .background(type == .fire ? Color.red : Color.white)
                                .cornerRadius(15)
                                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                        }
                        
                        Button {
                            type = .grass
                        } label: {
                            Text("풀").padding()
                                .font(.system(size: 20, weight: .semibold))
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .foregroundColor(type == .grass ? .white : .black)
                                .background(type == .grass ? Color.green : Color.white)
                                .cornerRadius(15)
                                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                        }
                        
                        Button {
                            type = .poison
                        } label: {
                            Text("독").padding()
                                .font(.system(size: 20, weight: .semibold))
                                .frame(maxWidth: .infinity, maxHeight: 50)
                                .foregroundColor(type == .poison ? .white : .black)
                                .background(type == .poison ? Color.purple : Color.white)
                                .cornerRadius(15)
                                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.gray, lineWidth: 1))
                        }
                }
                
                }
                
                VStack {
                    ForEach(pokemons, id: \.self) { pokemon in
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
                
                Spacer()
                
                Button {
                    pokemons.append(Pokemon(name: name, type: type))
                } label: {
                    if pokemons.count == 3 {
                        NavigationLink(destination: {
                            PlayingGameView(myData: $pokemons)
                        }, label: {
                            Text("시작하기")
                        })
                    } else {
                        Text("생성하기")
                    }
                }
                .padding(20)
                .frame(maxWidth: .infinity, maxHeight: 50)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(20)

            }.padding(30)
        }
    }
}
//
//struct ButtonStyle: View {
//
//    var body: some View {
//        Button {
//            pokemons.append(Pokemon(name: name, type: type))
//        } label: {
//            if pokemons.count == 3 {
//                NavigationLink(destination: {
//                    PlayingGameView(myData: $pokemons)
//                }, label: {
//                    Text("시작하기")
//                })
//            } else {
//                Text("생성하기")
//            }
//        }
//        .padding(20)
//        .frame(maxWidth: .infinity, maxHeight: 50)
//        .foregroundColor(.white)
//        .background(.blue)
//        .cornerRadius(20)
//    }
//}

struct CharacterGame_Previews: PreviewProvider {
    static var previews: some View {
        CharacterGame()
    }
}
