//
//  RocketsService.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 24/2/21.
//

import Foundation
import Combine
import SpaceXApi
import SpaceXClient

final class RocketsService: ApiService<BasicAlertError>, ObservableObject {

    @Published var list: [Rocket] = []

    func getAllRockets() {
        client.getAllRockets()
            .mapError({mapError(error: $0)})
            .compactMap({ dto in dto.map({ $0.rocket }) })
            .subscribe(on: DispatchQueue.global())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: receiveCompletion, receiveValue: setRockets)
            .store(in: &subscribers)
    }

    private func setRockets( _ rockets: [Rocket]) {
        if rockets.isEmpty {
            state = .idle()
        } else {
            self.list = rockets
            state = .loaded()
        }
    }

}
