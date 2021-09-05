//
//  PokemonContainerListViewModel.swift
//  Pokedex
//
//  Created by Adi Mizrahi on 10/06/2020.
//  Copyright © 2020 Tap.pm. All rights reserved.
//

import Foundation
class PokemonContainerListViewModel: ObservableObject {
    
    //let didChange = PassthroughSubject<ArticleListViewModel,Never>()
    var hasMoreRows = true
    init() {
        fetchPokemon(0)
    }
    
    @Published var pokemon = [PokemonContainerViewModel]()
    
    func fetchPokemon(_ offset: Int) {
        
        guard let url = URL(string: NetworkUtils.API_PREFIX + NetworkUtils.PATH + "&offset=\(offset)") else {
            fatalError("URL is not correct!")
        }
        NetworkUtils.isPulling = true
        Webservice().loadPokemonContainers(url: url) { pokemon in
            
            if var pokemon = pokemon {
                pokemon = pokemon.sorted(by: { $0.details!.id < $1.details!.id })
                //self.pokemon = pokemon.map(PokemonContainersViewModel.init)
                self.pokemon.append(contentsOf: pokemon.map(PokemonContainerViewModel.init))
                NetworkUtils.isPulling = false
            }
            
        }
        
    }
    
}
