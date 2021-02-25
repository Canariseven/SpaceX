//
//  RocketsMapper.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 24/2/21.
//

import Foundation
import SpaceXApi

extension RocketDTO {

    var rocket: Rocket {
        Rocket.init(id: self.id,
                    flickr_images: self.flickr_images,
                    height: Measurement<UnitLength>(value: Double(self.height.meters), unit: UnitLength.meters),
                    diameter: Measurement<UnitLength>(value: Double(self.diameter.meters), unit: UnitLength.meters),
                    mass: Measurement<UnitMass>(value: Double(self.mass.kg), unit: .kilograms),
                    name: self.name,
                    type: self.type,
                    active: self.active,
                    stages: self.stages,
                    country: self.country,
                    company: self.company,
                    wikipedia: self.wikipedia,
                    description: self.description)
    }

}
