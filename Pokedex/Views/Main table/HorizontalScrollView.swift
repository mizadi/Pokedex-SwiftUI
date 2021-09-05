//
//  HorizontalScrollView.swift
//  Pokedex
//
//  Created by Adi Mizrahi on 10/06/2020.
//  Copyright © 2020 Tap.pm. All rights reserved.
//

import SwiftUI

struct HorizontalScrollView: View {
    
    var pokemonContainer: PokemonContainerViewModel
    
    init(_ pokemonContainer: PokemonContainerViewModel) {
        self.pokemonContainer = pokemonContainer
    }
    
    var body: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            HStack {
                ForEach(pokemonContainer.sprites, id: \.self) { url in
                    NavigationLink(destination: DetailsScreen(pokemon: self.pokemonContainer)) {
                        AsyncImage(
                            url: url,
                            placeholder: Text(" ")
                        ).aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                    }
                }
            }
        }
    }
}
