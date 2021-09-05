//
//  PokemonDetailsViewModel.swift
//  Pokedex
//
//  Created by Adi Mizrahi on 10/06/2020.
//  Copyright © 2020 Tap.pm. All rights reserved.
//

import Foundation

class PokemonDetailsViewModel: Identifiable {
    
    let id = UUID()
    
    let pokemonDetails: PokemonDetails
    
    init(pokemonDetails: PokemonDetails) {
        self.pokemonDetails = pokemonDetails
    }
    
    var name: String {
        return self.pokemonDetails.name
    }
    
    var sprites: [URL] {
        return Array(self.pokemonDetails.sprites.values)
    }
    
//    var description: String {
//        return self.stickers.description ?? ""
//    }
    
    
}
