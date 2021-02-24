//
//  RocketsService.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 24/2/21.
//

import Combine
import SpaceXApi
import SpaceXClient

final class RocketsService: ObservableObject {
    @Published var list : [Rocket] = []
    
    private var client: Client
    private var subscribers: Set<AnyCancellable> = Set<AnyCancellable>()
    
    init(client: Client) {
        self.client = client
    }
    
    func getAllRockets() {
        client.getAllRockets().sink { (result) in
            switch result {
            case .finished:
                debugPrint("Finished")
            case .failure(let error):
                debugPrint(error)
            }
        } receiveValue: { (dto) in
            self.list = dto.map({ $0.rocket })
        }.store(in: &subscribers)
    }

}
