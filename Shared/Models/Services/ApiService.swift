//
//  ApiService.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 23/1/21.
//

import Foundation
import Combine
import SpaceXApi
import SpaceXClient
import SwiftUI

class ApiService<T: AlertsBuilderType>: NSObject, ApiServiceType {

    @Published var alert: T?
    @Published var state: GenericStates = .idle()

    var subscribers: Set<AnyCancellable> = Set<AnyCancellable>()
    let client: Client

    init(client: Client) {
        self.client = client
        super.init()
    }

    open func mapped(_ error: Error) -> LocalizedStringKey {
        LocalizedStringKey("generic.message")
    }

}
