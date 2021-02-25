//
//  GenericStates.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 22/1/21.
//

import Foundation
import SwiftUI

enum GenericStates: Equatable {

    static func ==(lhs: GenericStates, rhs: GenericStates) -> Bool {
        return lhs.rawValue == rhs.rawValue
    }

    var isLoading: Bool {
        self.rawValue == 1
    }

    var rawValue: Int {
        switch self {

        case .loading:
            return 1
        case .loaded:
            return 2
        case .idle:
            return 3
        case .error:
            return 4
        }
    }

    case loading(_ text: LocalizedStringKey = "Cargando...")
    case loaded(_ text: LocalizedStringKey = "")
    case idle(_ text: LocalizedStringKey = "No hemos recibido muchos datos.")
    case error(_ text: LocalizedStringKey = "Ha ocurrido un problema al cargar esta pantalla.")

    var text: LocalizedStringKey {
        switch self {
        case .loading(let text):
            return text
        case .loaded(let text):
            return text
        case .idle(let text):
            return text
        case .error(let text):
            return text
        }
    }
}
