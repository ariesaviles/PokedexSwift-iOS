//
//  InfoBorder.swift
//  PokedexSwiftUI
//
//  Created by aries on 5/3/21.
//

import SwiftUI
import Neumorphic

struct InfoBorder: View {
    let pokemon: Pokemon
    
    
    var colorType: Color {
        switch pokemon.type {
        case "poison":
            return Color(hex: 0xcdf7cf)
        case "grass":
            return Color(hex: 0xc4f7ba)
        case "fire":
            return Color(hex: 0xf79c68)
        default:
            return .clear
        }
    }
    
    
    
    var body: some View {
        
        
        ZStack {
//            Rectangle()
//                .fill(Color(hex: 0xff6e6e))
//                .frame(height: screenHeight)
//                .edgesIgnoringSafeArea(.top)
//                .position(x: screenWidth/2, y: screenHeight/2)
//                .padding(.bottom, -95)

            RoundedRectangle(cornerSize: CGSize(width: 40, height: 30))
                .fill(Color(hex: 0xe03a3a))
                .frame(height: screenHeight)
                .edgesIgnoringSafeArea(.top)
                .position(x: screenWidth/2, y: screenHeight/2)
                .padding(.bottom, -95)
            
            RoundedRectangle(cornerSize: CGSize(width: 40, height: 30))
                .fill(Color(hex: 0xb82525))
                .frame(height: screenHeight)
                .edgesIgnoringSafeArea(.top)
                .position(x: screenWidth/2 + 30, y: screenHeight/2)
                .padding(.bottom, -95)
            
            RoundedRectangle(cornerSize: CGSize(width: 40, height: 30))
                .fill(Color.Neumorphic.main)
                .softInnerShadow(RoundedRectangle(cornerRadius: 30), darkShadow: Color.black.opacity(0.6), lightShadow: Color.white.opacity(0), spread: 0.05, radius: 2)
                .frame(height: screenHeight)
                .edgesIgnoringSafeArea(.top)
                .position(x: screenWidth/2 + 40, y: screenHeight/2 + 10)
                .padding(.bottom, -95)
                
            
            
            // protrusion
            ZStack {
                // bottom layers
                RoundedRectangle(cornerSize: CGSize(width: 40, height: 30))
                    .fill(Color(hex: 0xb82525))
                    .frame(width: screenWidth/1.15, height: screenHeight/3)
                    .edgesIgnoringSafeArea(.top)
                    .position(x: screenWidth/2 - 5, y: screenHeight/3.5 + 5)
                    .padding(.bottom, -95)
                    .shadow(color: Color.black.opacity(0.3), radius: 5, x: 7, y: 5)
                
                RoundedRectangle(cornerSize: CGSize(width: 40, height: 30))
                    .fill(Color(hex: 0xe03a3a))
                    .frame(width: screenWidth/1.15, height: screenHeight/3)
                    .edgesIgnoringSafeArea(.top)
                    .position(x: screenWidth/2 - 10, y: screenHeight/3.5)
                    .padding(.bottom, -95)
                
                RoundedRectangle(cornerSize: CGSize(width: 40, height: 30))
                    .fill(colorType).softInnerShadow(RoundedRectangle(cornerRadius: 30), darkShadow: Color.black.opacity(0.7), lightShadow: Color.white.opacity(0.0), spread: 0.09, radius: 2)
                    .frame(width: screenWidth/1.5, height: screenHeight/4)
                    .edgesIgnoringSafeArea(.top)
                    .position(x: screenWidth/2 - 10, y: screenHeight/3.5)
                    .padding(.bottom, -95)
                
                AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemon.id).png")!,
                               placeholder: { Text("Loading ...") },
                               image: { Image(uiImage: $0).resizable() })
                    .frame(width: 230, height: 240, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .position(x: screenWidth/2 - 10, y: screenHeight/3.5)
                
                //top layers
            }.position(x: screenWidth/2 - 5, y: screenHeight/1.75)
                                                    
        }.edgesIgnoringSafeArea(.all)
    }
}

struct InfoBorder_Previews: PreviewProvider {
    static var previews: some View {
        InfoBorder(pokemon: MOCK_POKEMON[2])
    }
}
