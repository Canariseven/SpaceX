//
//  View+Alerts.swift
//  
//
//  Created by Carmelo Ruyman on 27/07/2020.
//  Copyright © 2020 Carmelo Ruyman. All rights reserved.
//

import SpaceXClient
import Foundation
import SwiftUI

protocol AlertsBuilderType: Identifiable, Error {
    var id: UUID { get }
    var title: Text { get }
    var message: Text { get }
    var primary: Alert.Button? { get }
    var secondary: Alert.Button? { get }    
}

extension AlertsBuilderType {
    
    static func build(error: Error) -> BasicAlertError? {
        if let error = error as? ClientError {
            if case ClientError.noReachability = error {
                return BasicAlertError.noReachability
            }
            return nil
        }
        return nil
    }

}

struct AlertTypeOne<T>: ViewModifier where T: AlertsBuilderType {

    @Binding var isPresented: Bool
    var typeOfAlert: T

    func body(content: Content) -> some View {
        content.alert(isPresented: $isPresented) { () -> Alert in
            if let primary = typeOfAlert.primary, let secondary = typeOfAlert.secondary {
                return Alert(title: typeOfAlert.title, message: typeOfAlert.message, primaryButton: primary, secondaryButton: secondary)
            } else if let primary = typeOfAlert.primary {
                return Alert(title: typeOfAlert.title, message: typeOfAlert.message, dismissButton: primary)
            } else {
                return Alert(title: typeOfAlert.title, message: typeOfAlert.message)
            }
        }
    }

}

struct AlertTypeTwo<T>: ViewModifier where T: AlertsBuilderType & Identifiable {

    @Binding var typeOfAlert: T?

    func body(content: Content) -> some View {
        content.alert(item: $typeOfAlert) { (model) -> Alert in
            if let primary = model.primary, let secondary = model.secondary {
                return Alert(title: model.title, message: model.message, primaryButton: primary, secondaryButton: secondary)
            } else if let primary = model.primary {
                return Alert(title: model.title, message: model.message, dismissButton: primary)
            } else {
                return Alert(title: model.title, message: model.message)
            }
        }
    }

}

extension View {

    func showAlert<T>(isPresented: Binding<Bool>, typeOfAlert: T) -> some View where T: AlertsBuilderType {
        return self.modifier(AlertTypeOne(isPresented: isPresented, typeOfAlert: typeOfAlert))
    }

    func showAlert<T>(item: Binding<T?>) -> some View where T: AlertsBuilderType & Identifiable {
        return self.modifier(AlertTypeTwo(typeOfAlert: item))
    }

}
