//
//  PlanetResultModel.swift
//  sysco-task-ios
//
//  Created by Thathsara Senarathne on 2022-07-05.
//

import Foundation

// MARK: - PlanetResultModel
struct PlanetResultModel: Codable {
    let count: Int
    
    let next: String
    
    let previous: String?
    
    let results: [PlanetModel]
}
