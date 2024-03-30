//
//  PokemonService.swift
//  Pokemon
//
//  Created by Vitor Henrique Barreiro Marinho on 29/03/24.
//

import Foundation

typealias pokemonCompletion = (Result<[Pokemon?], Error>) -> ()

class PokemonService {
    
    let BASE_URL = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
    
    func getPokemons(completion: @escaping pokemonCompletion) {
        
        guard let url = URL(string: BASE_URL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            
            guard let data = data else { return }
            
            do {
                print ("DEBUG - Pokemon data: \(data)")
                
                let pokemons = try JSONDecoder().decode([Pokemon?].self, from: data)
                completion(.success(pokemons))
                print (pokemons)
            } catch let (error) {
                print ("DEBUG - Pokemon request error \(error)")
                
                print ("DEBUG - Pokemon request error \(error.localizedDescription)")
            }
        }.resume()
    }
}
