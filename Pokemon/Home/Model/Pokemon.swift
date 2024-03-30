//
//  Pokemon.swift
//  Pokemon
//
//  Created by Vitor Henrique Barreiro Marinho on 29/03/24.
//

import Foundation

struct Pokemon: Decodable {
    let attack: Int?
    let defense: Int?
    let description: String?
    let evolutionChain: [EvolutionChain]?
    let height: Int?
    let id: Int?
    let imageUrl: String?
    let name: String?
    let type: String?
    let weight: Int?
}

struct EvolutionChain: Decodable {
    let id: String?
    let name: String?
}
