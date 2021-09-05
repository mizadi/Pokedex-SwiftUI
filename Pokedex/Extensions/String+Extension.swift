//
//  String+Extension.swift
//  Pokedex
//
//  Created by Adi Mizrahi on 04/08/2020.
//  Copyright © 2020 Tap.pm. All rights reserved.
//

import Foundation
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
