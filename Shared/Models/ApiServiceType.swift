//
//  ApiServiceType.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 23/1/21.
//

import Foundation
import Combine
import SwiftUI

protocol ApiServiceType: class {
    associatedtype T: AlertsBuilderType
    var alert: T? { get set }
    var state: GenericStates { get set }
    func mapped(_ error: Error) -> LocalizedStringKey
}

extension ApiServiceType {

    func receiveCompletion( _ result: (Subscribers.Completion<T>)) {
        switch result {
        case .finished:
            debugPrint("Finished")
        case .failure(let error):
            debugPrint(error.localizedDescription)
            self.alert = error
            self.state = .error(mapped(error))
        }
    }

}
