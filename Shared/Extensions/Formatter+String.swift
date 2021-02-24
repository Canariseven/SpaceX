//
//  Formatter+String.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 24/2/21.
//

import Foundation

extension Measurement {

    func string() -> String {
        let fm = MeasurementFormatter()
        fm.unitStyle = .medium
        fm.unitOptions = .naturalScale
        return fm.string(from: self)
    }

}
