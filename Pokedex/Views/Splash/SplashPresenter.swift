//
//  SplashPresenter.swift
//  Pokedex
//
//  Created by Adi Mizrahi on 11/06/2020.
//  Copyright © 2020 Tap.pm. All rights reserved.
//

import Foundation

protocol SplashDelegate {
    func splashTimePassed()
}

class SplashPresenter {
    
    var delegate: SplashDelegate
    
    init(_ delegate: SplashDelegate) {
        self.delegate = delegate
    }
    
//    func goToMainScreen(time: Double) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + Double(time)) {
//            self.delegate.splashTimePassed()
//        }
//    }
}
