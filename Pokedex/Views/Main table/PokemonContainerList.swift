//
//  PokemonContainerList.swift
//  Pokedex
//
//  Created by Adi Mizrahi on 10/06/2020.
//  Copyright © 2020 Tap.pm. All rights reserved.
//

import SwiftUI

struct PokemonContainerList: View {
    
    @ObservedObject var model = PokemonContainerListViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                List(self.model.pokemon) { poke in
                    HorizontalScrollView(poke).opacity(self.model.pokemon.isEmpty ? 0 : 1).onAppear(perform: {
                        if poke == self.model.pokemon.last {
                            if !NetworkUtils.isPulling {
                                NetworkUtils.currentOffset = NetworkUtils.currentOffset + 10
                                self.model.fetchPokemon(NetworkUtils.currentOffset)
                            }
                        }
                    })
                }
                VStack {
                    Text("Loading...")
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                    .background(Color.secondary.colorInvert())
                    .foregroundColor(Color.primary)
                    .cornerRadius(20)
                    .opacity(self.model.pokemon.isEmpty ? 1 : 0)
            }
        }
    }
}

struct PokemonContainerList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonContainerList()
    }
}
