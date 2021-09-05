//
//  WebService.swift
//  Pokedex
//
//  Created by Adi Mizrahi on 09/06/2020.
//  Copyright © 2020 Tap.pm. All rights reserved.
//

import Foundation
import SwiftyJSON
class Webservice {
    
    func loadPokemonContainers(url: URL, completion: @escaping ([PokemonContainer]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            //let response = try? JSONDecoder().decode(NewsResponse.self, from: data)
            self.parseResponse(data) { (response) in
                guard let response = response else {
                    return
                }
                DispatchQueue.main.async {
                    completion(response.pokemon)
                }
            }
        }.resume()
    }
    
    func parseResponse(_ data: Data, _ completion: @escaping (NewsResponse?) -> ()) {
        var response = NewsResponse()
        let json = try! JSON(data: data)
        for (index,object) in json["results"].array!.enumerated() {
            var container = PokemonContainer(name: object["name"].string!, url: object["url"].string!)
            loadPokemonDetails(container) { (pokemonDetails) in
                container.details = pokemonDetails
                response.pokemon.append(container)
                if index == json["results"].array!.count - 1 {
                    completion(response)
                }
                
            }
        }
    }
    
    func loadPokemonDetails(_ container: PokemonContainer, completion: @escaping (PokemonDetails?) -> ()) {
        guard let url = URL(string: container.url) else {
            return
        }
        loadPokemonDetails(url: url) { (pokemonDetails) in
            guard let pokemonDetails = pokemonDetails else {
                completion(nil)
                return
            }
            completion(pokemonDetails)
        }
        
    }
    
    func loadPokemonDetails(url: URL, completion: @escaping (PokemonDetails?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            //let response = try? JSONDecoder().decode(NewsResponse.self, from: data)
            if let response = self.parseDetailsResponse(data) {
                DispatchQueue.main.async {
                    completion(response)
                }
            }
            
            
        }.resume()
    }
    
    func parseDetailsResponse(_ data: Data) -> PokemonDetails? {
        //var response = [PokemonDetails]()
        let json = try! JSON(data: data)
        var pokemonDetails = PokemonDetails(name: "", id: json["id"].int!)
        for sprite in json["sprites"].dictionary! {
            let name = sprite.key
            if let string = sprite.value.string {
                if let url = URL(string: string) {
                    pokemonDetails.sprites[name] = url
                }
            }
        }
        return pokemonDetails
    }
}
