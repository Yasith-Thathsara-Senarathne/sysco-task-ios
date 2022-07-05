//
//  PlanetModel.swift
//  sysco-task-ios
//
//  Created by Thathsara Senarathne on 2022-07-05.
//

import Foundation

// MARK: - PlanetModel
struct PlanetModel: Codable {
    let name, rotationPeriod, orbitalPeriod, diameter, climate, gravity, terrain, surfaceWater, population, created, edited, url: String
    
    let residents, films: [String]

    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter, climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population, residents, films, created, edited, url
    }
}
