//
//  PokemonData.swift
//  List
//
//  Created by PEDRO MENDEZ on 15/01/24.
//

import Foundation

struct PokemonData: Decodable {
    let count: Int
    let next: String
    let previous: String?
    let results: [Pokemon]
}

struct Pokemon: Decodable {
    let name: String
    let url: String
}
