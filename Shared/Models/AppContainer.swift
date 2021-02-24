//
//  AppContainer.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 24/2/21.
//

import Foundation
import SpaceXApi
import SpaceXClient

final class AppContainer: ObservableObject {
    
    let client: Client
    
    init(client: Client) {
        self.client = client
    }
    
    func resolve() -> RocketsService {
        RocketsService(client: client)
    }

}
