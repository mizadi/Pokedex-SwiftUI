//
//  NetworkUtils.swift
//  Pokedex
//
//  Created by Adi Mizrahi on 10/06/2020.
//  Copyright © 2020 Tap.pm. All rights reserved.
//

import Foundation
class NetworkUtils {
    static let API_PREFIX = "https://pokeapi.co/api/v2/"
    static let PATH = "pokemon?limit=10"
    static var currentOffset: Int = 0
    static var isPulling = false
}
