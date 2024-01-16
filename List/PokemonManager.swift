//
//  PokemonManager.swift
//  List
//
//  Created by PEDRO MENDEZ on 15/01/24.
//
import Foundation

protocol PokemonManagerDelegate {
    func PokemonList(list: [Pokemon])
}

struct PokemonManager {
    var delegate: PokemonManagerDelegate?
    
    func showPokemon() {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?limit=50")!
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
                    if let error = error {
                        print("Error: \(error)")
                    } else if let data = data {
                        do {
                            let decodedData = try JSONDecoder().decode(PokemonData.self, from: data)
                            DispatchQueue.main.async {
                                self.delegate?.PokemonList(list: decodedData.results)
                            }
                        } catch {
                            print("Error de decodificación: \(error)")
                        }
                    }
                }
                task.resume()
            }
        }

