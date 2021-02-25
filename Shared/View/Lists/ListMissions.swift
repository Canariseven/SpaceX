//
//  ListMissions.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 25/2/21.
//

import SwiftUI
import SpaceXApi

struct ListMissions: View {

    @StateObject var missionsService: MissionsService

    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            LazyVStack(alignment: .center, spacing: 8, pinnedViews: [], content: {
                ForEach(missionsService.missions, id: \.self) { mission in
                    RowMission(mission: mission)
                    CustomDivider(color: Color.black).padding(.horizontal)
                }
            })
        }).onAppear(perform: {
            missionsService.getAllMissions()
        })
    }
}

// struct ListMissions_Previews: PreviewProvider {
//    static var previews: some View {
//        ListMissions()
//    }
// }
