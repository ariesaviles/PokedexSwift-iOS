//
//  PokemonStatsBarGraph.swift
//  PokedexSwiftUI
//
//  Created by aries on 5/4/21.
//

import SwiftUI

struct PokemonStatsBarGraph: View {
    let label: String
    let stat: Int
    let color: Color
    
    var body: some View {
        HStack {
            Text(String(stat)).font(.custom("Menlo", size: 15))
            Text(label).font(.custom("Menlo", size: 16)).bold()
            Spacer()
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 20).fill(Color.black.opacity(0.03))
                            .softInnerShadow(RoundedRectangle(cornerRadius: 20), darkShadow: Color.black.opacity(0.7), lightShadow: Color.white.opacity(1), spread: 0.2, radius: 2)
                            .frame(width: 150, height:25)
                            
                RoundedRectangle(cornerRadius: 10).fill(color)
                    .frame(width: (stat < 150) ? CGFloat(stat) : 150, height:20)
                    .offset(y: -3)
            }
            
        }.frame(width: screenWidth/1.4)
    }
}

struct PokemonStatsBarGraph_Previews: PreviewProvider {
    static var previews: some View {
        PokemonStatsBarGraph(label: "Defense", stat: 70, color: Color.blue)
    }
}
