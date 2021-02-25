//
//  Rocket.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 24/2/21.
//

import Foundation

public struct Rocket: Identifiable, Hashable {
    public let id: String
    public let flickr_images: [URL]
    public let height: Measurement<UnitLength>
    public let diameter: Measurement<UnitLength>
    public let mass: Measurement<UnitMass>
    public let name: String
    public let type: String
    public let active: Bool
    public let stages: Int8
    public let country: String
    public let company: String
    public let wikipedia: URL
    public let description: String
}
