//
//  RowBasicStyle.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 25/2/21.
//

import SwiftUI

struct RowMission: View {

    let mission: Mission

    var body: some View {
        VStack(alignment: .leading, spacing: 8, content: {
            Text(mission.name).font(.title3)
            Text(mission.description).lineLimit(2).opacity(0.8).font(.footnote)
        })
        .padding()
        .background(Color.white)
    }

}

// struct RowBasicStyle_Previews: PreviewProvider {
//    static var previews: some View {
//        RowBasicStyle()
//    }
// }
