//
//  MissionMapper.swift
//  SpaceX
//
//  Created by Carmelo Ruymán Quintana Santana on 25/2/21.
//

import Foundation
import SpaceXApi

extension MissionDTO {

    var mission: Mission {
        Mission(name: mission_name,
                id: mission_id,
                manufacturers: manufacturers,
                payload_ids: payload_ids,
                wikipedia: wikipedia,
                website: website,
                description: description)
    }

}
