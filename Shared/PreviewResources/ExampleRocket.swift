//
//  ExampleRocket.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 24/2/21.
//

import Foundation

#if DEBUG

let exampleRocket : Rocket = Rocket(id: UUID().uuidString,
                                    flickr_images: ["https://farm5.staticflickr.com/4599/38583829295_581f34dd84_b.jpg", "https://farm5.staticflickr.com/4645/38583830575_3f0f7215e6_b.jpg", "https://farm5.staticflickr.com/4696/40126460511_b15bf84c85_b.jpg", "https://farm5.staticflickr.com/4711/40126461411_aabc643fd8_b.jpg"].map{URL(string: $0)!},
                                    height: Measurement<UnitLength>(value: 20, unit: .meters),
                                    diameter: Measurement<UnitLength>(value: 30, unit: .meters),
                                    mass: Measurement<UnitMass>(value: 3000, unit: .kilograms),
                                    name: "Example Rocket",
                                    type: "Rocket",
                                    active: true,
                                    stages: 3,
                                    country: "Spain",
                                    company: "Space Telde",
                                    wikipedia: URL(string: "https://en.wikipedia.org/wiki/Falcon_Heavy")!,
                                    description: "With the ability to lift into orbit over 54 metric tons (119,000 lb)--a mass equivalent to a 737 jetliner loaded with passengers, crew, luggage and fuel--Falcon Heavy can lift more than twice the payload of the next closest operational vehicle, the Delta IV Heavy, at one-third the cost.")

#endif
