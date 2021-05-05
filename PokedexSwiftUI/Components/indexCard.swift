//
//  indexCard.swift
//  PokedexSwiftUI
//
//  Created by aries on 5/2/21.
//

import SwiftUI

let screenSize = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height

struct indexCard: View {
    let pokemon: Pokemon
    var num: Int
    
    var body: some View {
        ZStack {
            VStack(spacing: 2) {
                VStack(alignment: .leading) {
                    Text(String(format: "#%03d", num)).padding(.top, 15)
                    Text(pokemon.name.capitalized)
                        .font(.headline)
                        .foregroundColor(.black)
                }
                
                AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(num).png")!,
                               placeholder: { Text("Loading ...") },
                               image: { Image(uiImage: $0).resizable() })
                    .frame(width: 120, height: 120, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding(.top, -10)
            }
//            RoundedRectangle(cornerRadius: 12, style: .continuous)
//                .stroke(Color(hex: 0x3cbbfa), lineWidth: 11)
//                .frame(width: (screenWidth/3) - 30, height: 135)
        }
        .frame(width: (screenWidth/2) - 40, height: 155)
        .background(Color.Neumorphic.main)
        .cornerRadius(12)
        
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 5, y: 5)
        .shadow(color: Color.white.opacity(1), radius: 5, x: -6, y: -6)
    }
}

struct indexCard_Previews: PreviewProvider {
    static var previews: some View {
        indexCard(pokemon: MOCK_POKEMON[1], num: 1)
    }
}


