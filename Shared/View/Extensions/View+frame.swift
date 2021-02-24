//
//  View+frame.swift
//  
//
//  Created by Carmelo Ruymán Quintana Santana on 28/12/20.
//

import SwiftUI

public extension View {

    func frame(_ vale: CGFloat) -> some View {
        self.frame(width: vale, height: vale, alignment: .center)
    }

    func infinityAll(alignment: Alignment = .center) -> some View {
        self.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: alignment)
    }

    func infinityWidth(alignment: Alignment = .center) -> some View {
        self.frame(minWidth: 0, maxWidth: .infinity, alignment: alignment)
    }

    func infinityHeight(alignment: Alignment = .center) -> some View {
        self.frame(minHeight: 0, maxHeight: .infinity, alignment: alignment)
    }

    func height(_ value: CGFloat, alignment: Alignment = .center) -> some View {
        self.frame(height: value, alignment: alignment)
    }

    func width(_ value: CGFloat, alignment: Alignment = .center) -> some View {
        self.frame(width: value, alignment: alignment)
    }

}
