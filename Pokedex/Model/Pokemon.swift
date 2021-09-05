//
//  Pokemon.swift
//  Pokedex
//
//  Created by Adi Mizrahi on 09/06/2020.
//  Copyright © 2020 Tap.pm. All rights reserved.
//

import Foundation
struct PokemonContainer {
    let name: String
    let url: String
    var details: PokemonDetails?
}


struct PokemonDetails {
    let name: String
    var sprites = [String: URL]()
    let id: Int
}

struct NewsResponse {
    var pokemon = [PokemonContainer]()
}
