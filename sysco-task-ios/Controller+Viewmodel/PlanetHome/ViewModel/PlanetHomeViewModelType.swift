//
//  PlanetHomeViewModelType.swift
//  sysco-task-ios
//
//  Created by Thathsara Senarathne on 2022-07-05.
//

import Foundation
import RxSwift
import RxCocoa

protocol PlanetHomeViewModelType {
    var planetListModel: Observable<[PlanetModel]> { get }
    
    var planetList: BehaviorRelay<[PlanetModel]> { get set }
    
    var mainLoading: Observable<Bool> { get }
    
    var backgroundLoading: Observable<Bool> { get }
    
    mutating func fetchPlanets()
    
    func fetchMorePlanets()
}
