//
//  TagStyle.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 24/2/21.
//

import SwiftUI

struct TagStyle: ViewModifier {
    var backgroundColor: Color
    var fontColor: Color

    func body(content: Content) -> some View {
        content.padding(8).foregroundColor(fontColor).background(backgroundColor).mask(Capsule())
    }

}

extension View {

    func applyTagStyle(backgroundColor: Color = Color.white, fontColor: Color = Color.black) -> some View {
        self.modifier(TagStyle(backgroundColor: backgroundColor, fontColor: fontColor))
    }

}
