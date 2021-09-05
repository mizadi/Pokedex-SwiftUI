//
//  PokemonContainerViewModel.swift
//  Pokedex
//
//  Created by Adi Mizrahi on 10/06/2020.
//  Copyright © 2020 Tap.pm. All rights reserved.
//

import Foundation

class PokemonContainerViewModel: Identifiable, Equatable {
    static func == (lhs: PokemonContainerViewModel, rhs: PokemonContainerViewModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    let id = UUID()
    
    let pokemonContainer: PokemonContainer
    
    init(pokemonContainer: PokemonContainer) {
        self.pokemonContainer = pokemonContainer
    }
    
//    var url: URL {
//        guard let sprites = self.pokemonContainer.details?.sprites, let url = sprites.values.first else {
//            return URL(string: "")!
//        }
//        return url
//    }
    
    var sprites: [URL] {
        return Array((self.pokemonContainer.details?.sprites.values)!)
    }
}

