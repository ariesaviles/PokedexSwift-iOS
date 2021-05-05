//
//  Pokemon.swift
//  PokedexSwiftUI
//
//  Created by aries on 5/2/21.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let description: String
    let height: Int
    let weight: Int
    let attack: Int
    let defense: Int


    
//    init(id: Int, name: String, type: String, description: String, height: Int, weight: Int, attack: Int, defense: Int) {
//        self.id = id
//        self.name = name
//        self.imageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(id+1).png"
//        self.type = type
//        self.description = description
//        self.height = height
//        self.weight = weight
//        self.attack = attack
//        self.defense = defense
//    }
    
}




let MOCK_POKEMON: [Pokemon] = [
    .init(id: 0, name: "Bulbasaur",imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png", type: "grass", description: "bulbasaur :)", height: 7, weight: 69, attack: 49, defense: 49),
    .init(id: 1, name: "Ivysaur",imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png", type: "grass", description: "There is a bud on this Pokémon’s back. To support its weight, Ivysaur’s legs and trunk grow thick and strong. If it starts spending more time lying in the sunlight, it’s a sign that the bud will bloom into a large flower soon.", height: 20, weight: 100, attack: 50, defense: 69),
    .init(id: 6, name: "Char",imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/5.png", type: "fire", description: "bulbasaur :)", height: 7, weight: 69, attack: 49, defense: 49),
]
