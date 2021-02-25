//
//  CustomDivider.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 25/2/21.
//

import Foundation
import SwiftUI

struct CustomDivider: View {
    
    var color: Color = Color.white
    
    var body: some View {
        Divider().background(color)
    }
    
}


