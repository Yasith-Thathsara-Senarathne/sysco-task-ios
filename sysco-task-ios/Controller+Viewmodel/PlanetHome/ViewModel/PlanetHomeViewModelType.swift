//
//  PlanetHomeViewModelType.swift
//  sysco-task-ios
//
//  Created by Thathsara Senarathne on 2022-07-05.
//

import Foundation
import RxSwift

protocol PlanetHomeViewModelType {
    var planetListModel: Observable<[PlanetModel]> { get }
    
    func fetchPlanets()
}
