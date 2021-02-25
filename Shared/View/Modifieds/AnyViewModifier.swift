//
//  AnyViewModifier.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 22/1/21.
//

import SwiftUI

extension View {
    
    func anyView() -> AnyView {
        AnyView(self)
    }
    
}
