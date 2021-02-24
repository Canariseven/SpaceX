//
//  SpaceXApp.swift
//  Shared
//
//  Created by Carmelo Ruymán Quintana Santana on 23/2/21.
//

import SwiftUI
import SpaceXApi
import SpaceXClient

@main
struct SpaceXApp: App {

    private let appContainer : AppContainer
    
    init() {
        let client = Client()
        self.appContainer = AppContainer(client: client)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().accentColor(Color.black).environmentObject(appContainer)
        }
    }
}
