//
//  DetailsScreen.swift
//  Pokedex
//
//  Created by Adi Mizrahi on 11/06/2020.
//  Copyright © 2020 Tap.pm. All rights reserved.
//

import SwiftUI

let articleContent =
    
"""
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
At vero eos et accusam et justo duo dolores et ea rebum.
Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.
At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
"""

struct DetailsScreen: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
//    var btnBack : some View { Button(action: {
//        self.presentationMode.wrappedValue.dismiss()
//    }) {
//        //HStack {
////            Image("logo") // set image here
////                .aspectRatio(contentMode: .fit)
////                .foregroundColor(.white).frame(width: 50)
//            Text("Go back").foregroundColor(.blue)
//        //}
//        }
//    }
    
    var pokemon: PokemonContainerViewModel
    
    var body: some View {
        ScrollView {
            GeometryReader { geometry in
                ZStack {
                    if geometry.frame(in: .global).minY <= 0 {
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .offset(y: geometry.frame(in: .global).minY/9)
                            .clipped()
                    } else {
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                            .clipped()
                            .offset(y: -geometry.frame(in: .global).minY)
                    }
                }
            }
            .frame(height: 400)
            VStack(alignment: .leading) {
                HStack {
                    AsyncImage(
                        url: pokemon.sprites[0],
                        placeholder: Text("Loading ...")
                    )
                        //.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 60, height: 60)
                        .clipped()
                        .cornerRadius(10)
                    VStack(alignment: .leading) {
                        Text("Pokemon #\(pokemon.pokemonContainer.details!.id)")
                            .font(.custom("AvenirNext-Regular", size: 15))
                            .foregroundColor(.gray)
                        Text("\(pokemon.pokemonContainer.name.capitalizingFirstLetter())")
                            .font(.custom("AvenirNext-Demibold", size: 15))
                    }
                }
                .padding(.top, 20)
                Text(pokemon.pokemonContainer.name.capitalizingFirstLetter())
                    .font(.custom("AvenirNext-Bold", size: 30))
                    .lineLimit(nil)
                    .padding(.top, 10)
                Text("3 min read • 22. November 2019")
                    .font(.custom("AvenirNext-Regular", size: 15))
                    .foregroundColor(.gray)
                    .padding(.top, 10)
                Text(articleContent)
                    .font(.custom("AvenirNext-Regular", size: 20))
                    .lineLimit(nil)
                    .padding(.top, 30)
            }
            .frame(width: 350)
        } .edgesIgnoringSafeArea(.top)
            //.navigationBarBackButtonHidden(true)
            //.navigationBarItems(leading: btnBack)
    }
}

//struct DetailsScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailsScreen()
//    }
//}
