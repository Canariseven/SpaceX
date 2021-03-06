//
//  BasicAlertError.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 21/1/21.
//

import Foundation
import SwiftUI
import SpaceXClient

enum BasicAlertError: Int, AlertsBuilderType, Error {

    case genericError = 0
    case noReachability = 1
    case noLocation = 4

    var id: UUID {
        UUID()
    }

    var title: Text {
        var text: LocalizedStringKey = "Ups!"
        switch self {
        case .genericError:
            text = "Ups!"
        case .noReachability:
            text = "Ups!"
        case .noLocation:
            text = "Ups!"
        }

        return Text(text, bundle: .main)
    }

    var message: Text {
        var text: LocalizedStringKey = "Something has happened"
        switch self {
        case .genericError:
            text = "generic.message"
        case .noReachability:
            text = "connection.error.message"
        case .noLocation:
            text = "location.disabled.info.alert"
        }
        return Text(text, bundle: .main)
    }

    var primary: Alert.Button? {
        var text: LocalizedStringKey = "Ok!"
        switch self {
        case .genericError, .noReachability:
            text = "Ok!"
        case .noLocation:
            text = "Ok!"
        }
        return Alert.Button.default(Text(text))
    }

    var secondary: Alert.Button? { nil }
}

func mapError(error: Error) -> BasicAlertError {
    if let error = error as? ClientError {
        switch error {
        case .couldNotDecodeJSON:
            return BasicAlertError.genericError
        case .badStatus:
            return BasicAlertError.genericError
        case .noReachability:
            return BasicAlertError.genericError
        case .badRefreshToken:
            return BasicAlertError.genericError
        case .unauthorizedError:
            return BasicAlertError.genericError
        case .requestEntityTooLarge:
            return BasicAlertError.genericError
        case .clientError:
            return BasicAlertError.genericError
        case .serverError:
            return BasicAlertError.genericError
        }
    } else {
        return BasicAlertError.genericError
    }
}
