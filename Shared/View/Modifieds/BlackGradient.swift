//
//  BlackGradient.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 24/2/21.
//

import SwiftUI

struct BlackGradient: ViewModifier {
    
    func body(content: Content) -> some View {
        content.background(LinearGradient(gradient: Gradient(colors: [Color.black.opacity(1), Color.black.opacity(0.01)]),
                                          startPoint: .bottom, endPoint: .top))
    }

}

struct WhiteGradient: ViewModifier {
    
    func body(content: Content) -> some View {
        content.background(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(1), Color.white.opacity(0.00)]),
                                          startPoint: .bottom, endPoint: .top))
    }

}

extension View {
    
    func blackBackgroundGradient() -> some View {
        self.modifier(BlackGradient())
    }
    
    func whiteBackgroundGradient() -> some View {
        self.modifier(WhiteGradient())
    }
    
}
