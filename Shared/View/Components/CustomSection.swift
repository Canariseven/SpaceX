//
//  CustomSection.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 24/2/21.
//

import SwiftUI

struct CustomSection<Content>: View where Content: View {
    let title: LocalizedStringKey
    var offset: CGFloat = 0.0
    let content: () -> (Content)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8, content: {
            Text(title).font(.title2).bold().offset(x:offset)
            content()
        })
    }
}

struct CustomSection_Previews: PreviewProvider {
    static var previews: some View {
        CustomSection(title: "Example section") {
            Text("Un contenido")
        }
    }
}
