//
//  CustomGradient.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 25/2/21.
//

import Foundation
import SwiftUI

struct CustomGradient: ViewModifier {

    var color: Color
    var secondColor: Color

    func body(content: Content) -> some View {
        content.background(LinearGradient(gradient: Gradient(colors: [color, secondColor]),
                                          startPoint: .bottom, endPoint: .top))
    }

}

enum TypeGradient {

    case white
    case black

}

extension View {

    func applyCustomGradient(type: TypeGradient) -> some View {
        switch type {
        case .black:
            return self.modifier(CustomGradient(color: Color.black, secondColor: Color.black.opacity(0)))
        case .white:
            return self.modifier(CustomGradient(color: Color.white, secondColor: Color.white.opacity(0)))
        }
    }

}
