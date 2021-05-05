//
//  PokemonInfoView.swift
//  PokedexSwiftUI
//
//  Created by aries on 5/3/21.
//

import SwiftUI

struct PokemonInfoView: View {
    var pokemon: Pokemon
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
        }) {
             Text("Back").fontWeight(.bold)
        }.softButtonStyle(Capsule(), pressedEffect: .hard).padding(.leading, 50)
    }
    
    var btnCaught : some View { Button(action: {
//        pokemon.isCaught(status: true)
        }) {
             Text("Back").fontWeight(.bold)
        }.softButtonStyle(Capsule(), pressedEffect: .hard).padding(.leading, 50)
    }
  
    var body: some View {
        
        
        ZStack {
            InfoBorder(pokemon: pokemon)
            
            VStack(alignment: .leading) {
                Text(String(format: "#%03d", pokemon.id))
                    .font(.custom("Menlo", size: 20))
                    .fontWeight(.heavy)
                
                Text(pokemon.name)
                    .font(.custom("Menlo", size: 30))
                    .fontWeight(.heavy)
            }.position(x: screenWidth/2 - 50, y: 120)
            
                
            VStack {
                
                Text("\(pokemon.description)").font(.custom("Menlo", size: 14))
//                Text(pokemon.caught ? "true" : "false")
                Spacer()
                
                PokemonStatsBarGraph(label: "Attack", stat: pokemon.attack, color: Color.red)
                
                PokemonStatsBarGraph(label: "Defense", stat: pokemon.defense, color: Color.yellow)
                
                PokemonStatsBarGraph(label: "Height", stat: pokemon.height, color: Color.green)
                
                PokemonStatsBarGraph(label: "Weight", stat: pokemon.weight, color: Color.blue)
                                   
                
            }.frame(width: screenWidth/1.4, height: screenHeight/2.6).position(x: screenWidth/2 + 10, y: screenHeight/1.35)
            
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .ignoresSafeArea(.all)
    }
}

struct PokemonInfoView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonInfoView(pokemon: MOCK_POKEMON[1])
    }
}
