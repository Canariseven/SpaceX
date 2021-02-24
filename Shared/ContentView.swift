//
//  ContentView.swift
//  Shared
//
//  Created by Carmelo Ruymán Quintana Santana on 23/2/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appContainer : AppContainer
    
    var body: some View {
        NavigationView {
            CarouselRockets(rocketService: appContainer.resolve()).navigationTitle("SpaceX Rockets")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(appContainerPreview)
    }
}
