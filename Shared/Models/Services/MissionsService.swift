//
//  MissionsService.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 25/2/21.
//

import Foundation
import Combine
import SpaceXApi
import SpaceXClient

final class MissionsService: ApiService<BasicAlertError>, ObservableObject {

    @Published var missions: [Mission] = []

    func getAllMissions() {
        self.state = .loading()
        client.getAllMissions()
            .mapError({mapError(error: $0)})
            .map({ list in list.map({ $0.mission })})
            .subscribe(on: DispatchQueue.global())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: receiveCompletion, receiveValue: setMissions)
            .store(in: &subscribers)
    }

    private func setMissions( _ missions: [Mission]) {
        if missions.isEmpty {
            state = .idle()
        } else {
            self.missions = missions
            state = .loaded()
        }
    }

}
