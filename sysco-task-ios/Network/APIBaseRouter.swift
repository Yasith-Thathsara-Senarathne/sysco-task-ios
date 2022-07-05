//
//  APIService.swift
//  sysco-task-ios
//
//  Created by Thathsara Senarathne on 2022-07-05.
//

import Foundation
import Moya

public protocol APIBaseRouter: TargetType {}

extension APIBaseRouter {
    
    var baseURL: URL { URL.init(string: "https://swapi.dev/api/")! }
    
    var task: Task {
        return .requestPlain
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        return [:]
    }
}
