//
//  pokedexView.swift
//  PokedexSwiftUI
//
//  Created by aries on 5/2/21.
//

import SwiftUI

struct pokedexView: View {
    private let gridCards = [GridItem(.flexible()), GridItem(.flexible())]
    @ObservedObject var json = HandleJson()
    @State var searchValue = ""
    
    //@State var count: Int = 1 // used initially in increment attempt
    // used to track rotation of pokeball imprint
    @State private var scrollViewContentOffset = CGFloat(0)
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                    ZStack {
                        PokedexHeader()
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.white.opacity(0.9), radius: 10, x: -5, y: -5)
                        
                        Image("pokeballPattern").resizable()
                            .frame(width: 120, height: 120)
                            .rotationEffect(.degrees(Double(scrollViewContentOffset)/5), anchor: .center)
                            .position(x: screenWidth - 50, y: 0)
                        
                        
                            
                        VStack {
//                            Text("\(scrollViewContentOffset)")
                            HStack {
                                Image(systemName: "magnifyingglass").foregroundColor(.black).font(Font.body.weight(.bold))
                                TextField("Search for Pokemon", text: $searchValue).foregroundColor(.black).frame(width: screenWidth/1.4)
                            }
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 25).fill(Color.Neumorphic.main)
                                .softInnerShadow(RoundedRectangle(cornerRadius: 25), darkShadow: Color.black.opacity(0.7), lightShadow: Color.white.opacity(1), spread: 0.09, radius: 2)
                            ).offset(y: 10)
                            .background(
                                RoundedRectangle(cornerRadius: 30)
                                    .fill(Color(hex: 0xb82525))
                                    .frame(width: screenWidth/1.4 + 80, height: 70)
                                    .offset(y: 10)
                            )
                        }
                        .padding()
                        
//                        HStack {
//                            TextField("Search for Pokemon", text: $searchValue)
//                        }
//                        .padding()
//                        .background(Color.white)
//                        .cornerRadius(25)
//                        .padding(.horizontal, 30)
//                        .offset(y: 25)
                        
                    }
                        
                    
                    TrackableScrollView(.vertical, showIndicators: false, contentOffset: $scrollViewContentOffset) {
                        LazyVGrid(columns: gridCards, alignment: .center, spacing: 35) {
                            
//                            ForEach((json.pokemon.indices).filter({ "\($0+1)".contains(searchValue) || searchValue.isEmpty }), id: \.self) {
                            ForEach((json.pokemon).filter( { pokemon in "\(pokemon.name)".contains(searchValue.lowercased()) || searchValue.isEmpty })) { pokemon in
//                                if (json.pokemon[index].name.filter({ "\($0)".contains(searchValue) }))
                                NavigationLink(destination: PokemonInfoView(pokemon: pokemon).edgesIgnoringSafeArea(.all)) {
                                    indexCard(pokemon: pokemon, num: pokemon.id)
                                }
                            }
                        }
                        .padding()                        
                        .navigationBarHidden(true)
                    }
                    .offset(y: screenHeight/26.5)
                    .frame(height: screenHeight/1.2)
                
                }
                .background(Color.Neumorphic.main)
                .position(x: screenWidth/2, y: screenHeight/2)
        }
    }
    
//    func incrementCount(pokemon: Pokemon, num: Int, imageUrl: String) -> indexCard {
//        self.count += 1
////        \(index+1).png"
//        return indexCard(pokemon: pokemon, num: self.count, url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(count+1).png")
//    }
}

struct pokedexView_Previews: PreviewProvider {
    static var previews: some View {
        pokedexView()
    }
}


