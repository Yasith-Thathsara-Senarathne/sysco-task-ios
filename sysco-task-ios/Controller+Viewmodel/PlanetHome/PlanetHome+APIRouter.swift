//
//  PlanetHome+APIRouter.swift
//  sysco-task-ios
//
//  Created by Thathsara Senarathne on 2022-07-06.
//

import Foundation
import Moya

extension PlanetHomeViewModel {
    enum APIRoute {
        case fetchPlanets(page: Int)
    }
}

extension PlanetHomeViewModel.APIRoute: APIBaseRouter {
    var path: String {
        switch self {
        case .fetchPlanets:
            return "planets"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchPlanets:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .fetchPlanets(page):
            let param = ["page" : page]
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        }
    }
}
