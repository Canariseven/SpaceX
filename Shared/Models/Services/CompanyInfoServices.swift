//
//  CompanyInfoServices.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 25/2/21.
//

import Foundation
import Combine
import SpaceXClient
import SpaceXApi

final class CompanyInfoService: ApiService<BasicAlertError>, ObservableObject {

    @Published var company: CompanyInfoDTO?

    func getCompanyInfo() {
        state = .loading()
        client.getInfoCompany()
            .mapError({mapError(error: $0)})
            .subscribe(on: DispatchQueue.global())
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: receiveCompletion, receiveValue: setCompany)
            .store(in: &subscribers)
    }

    private func setCompany( _ company: CompanyInfoDTO) {
        self.company = company
        state = .loaded()
    }

}
