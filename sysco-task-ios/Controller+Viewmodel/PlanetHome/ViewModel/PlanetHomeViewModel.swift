//
//  PlanetHomeViewModel.swift
//  sysco-task-ios
//
//  Created by Thathsara Senarathne on 2022-07-05.
//

import Foundation
import RxSwift
import Moya

struct PlanetHomeViewModel: PlanetHomeViewModelType {
    private let apiProvider = MoyaProvider<APIRoute>()
    
    // planet result model subject
    private let planetListModelSubject = PublishSubject<[PlanetModel]>.init()
    
    var planetListModel: Observable<[PlanetModel]> {
        planetListModelSubject.asObservable()
    }
    
    // loading subject
    private let loadingSubject = PublishSubject<Bool>.init()
    
    var loading: Observable<Bool> {
        loadingSubject.asObservable()
    }
    
    func fetchPlanets() {
        loadingSubject.onNext(true)
        
        _ = apiProvider.rx.request(.fetchPlanets(page: 1))
            .map(PlanetResultModel.self)
            .asObservable()
            .do(onDispose: {
                loadingSubject.onNext(false)
            })
            .catchAndReturn(PlanetResultModel(count: 0, next: "", previous: "", results: []))
            .subscribe(onNext: {
                self.planetListModelSubject.onNext($0.results)
            },onError: { error in
                print(error)
            })
    }
    
    
}
