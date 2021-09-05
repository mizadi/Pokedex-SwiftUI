//
//  Splash.swift
//  Pokedex
//
//  Created by Adi Mizrahi on 11/06/2020.
//  Copyright © 2020 Tap.pm. All rights reserved.
//

import SwiftUI

struct Splash: View {
    
    @State var isActive = false
    var contentView = ContentView()
    var presenter: SplashPresenter!
    
    init() {
       // self.presenter = SplashPresenter(self)
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Image("logo").resizable().frame(width: 250, height: 100).aspectRatio(contentMode: .fit)
                NavigationLink(destination: contentView,
                               isActive: $isActive,
                               label: { EmptyView() })
            }.onAppear(perform: {
                self.goToMainScreen(time: 1.0)
            })
        }
    }
    
    func goToMainScreen(time: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(time)) {
            self.isActive = true
        }
    }
//    func splashTimePassed() {
//        DispatchQueue.main.async {
//            self.isActive = true
//        }
//    }
    
    
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
