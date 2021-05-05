//
//  HandleJson.swift
//  PokedexSwiftUI
//
//  Created by aries on 5/2/21.
//

import SwiftUI

class HandleJson: ObservableObject {
    @Published var pokemon = [Pokemon]()
    let baseUrl = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    // call function
    init() {
        fetchPokemon()
        print(pokemon)
    }
    
    // create function
    func fetchPokemon() {
        guard let url = URL(string: baseUrl) else { return }
        
        // reach out to api
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data?.parseData(removeString: "null,") else { return } // grab data
            // asign data to Pokemon objects
            guard let pokemon = try? JSONDecoder().decode([Pokemon].self, from: data) else { return }
            
            DispatchQueue.main.async {
                self.pokemon = pokemon
            }
        }.resume()
        
    }
}

extension Data {
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
        let parsedDataString = dataAsString?.replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else { return nil }
        return data
    }
}



