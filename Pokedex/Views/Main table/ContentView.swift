//
//  ContentView.swift
//  Pokedex
//
//  Created by Adi Mizrahi on 09/06/2020.
//  Copyright © 2020 Tap.pm. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        PokemonContainerList()
            .navigationBarTitle("")
            .navigationBarHidden(true)
    }
}
