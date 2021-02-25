//
//  ListOfRockets.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 24/2/21.
//

import SwiftUI

struct CarouselRockets: View {

    @StateObject var rocketService: RocketsService

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            LazyHStack(alignment: .center, spacing: 16, pinnedViews: [], content: {
                ForEach(rocketService.list, id: \.id) { rocket in
                    NavigationLink(
                        destination: DetailRocket(rocket: rocket),
                        label: {
                            RowRocket(rocket: rocket)
                        })

                }
            }).padding(.horizontal)
        }).onAppear(perform: {
            rocketService.getAllRockets()
        })
    }
}

import SpaceXApi
import SpaceXClient
struct CarouselRockets_Previews: PreviewProvider {
    static var previews: some View {
        let service: RocketsService = appContainerPreview.resolve()
        service.list = [exampleRocket]
        return CarouselRockets(rocketService: service)
    }
}
