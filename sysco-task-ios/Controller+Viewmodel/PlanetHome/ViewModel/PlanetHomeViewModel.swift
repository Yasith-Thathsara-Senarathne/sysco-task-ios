//
//  PlanetHomeViewModel.swift
//  sysco-task-ios
//
//  Created by Thathsara Senarathne on 2022-07-05.
//

import Foundation
import RxSwift
import RxCocoa
import Moya

struct PlanetHomeViewModel {
    // API provider
    private let apiProvider = MoyaProvider<APIRoute>()
    
    // planet result model subject
    private let planetListModelSubject = PublishSubject<[PlanetModel]>.init()
    
    var planetListModel: Observable<[PlanetModel]> {
        planetListModelSubject.asObservable()
    }
    
    var planetList = BehaviorRelay<[PlanetModel]>(value: [])
    
    // main loading subject
    private let mainLoadingSubject = PublishSubject<Bool>.init()
    
    var mainLoading: Observable<Bool> {
        mainLoadingSubject.asObservable()
    }
    
    // background loading subject
    private let backgroundLoadingSubject = PublishSubject<Bool>.init()
    
    var backgroundLoading: Observable<Bool> {
        backgroundLoadingSubject.asObservable()
    }
    
    // fetch planets from server
    func fetchPlanets() {
        mainLoadingSubject.onNext(true)
        
        _ = apiProvider.rx.request(.fetchPlanets(page: 1))
            .map(PlanetResultModel.self)
            .asObservable()
            .do(onDispose: {
                mainLoadingSubject.onNext(false)
            })
            .catchAndReturn(PlanetResultModel(count: 0, next: "", previous: "", results: []))
            .subscribe(onNext: {
                planetList.accept($0.results)
                
                self.planetListModelSubject.onNext($0.results)
            },onError: { error in
                print(error)
            })
    }
    
    // fetch more planets from server
    func fetchMorePlanets() {
        backgroundLoadingSubject.onNext(true)
        
        _ = apiProvider.rx.request(.fetchPlanets(page: (planetList.value.count / 10) + 1))
            .map(PlanetResultModel.self)
            .asObservable()
            .do(onDispose: {
                backgroundLoadingSubject.onNext(false)
            })
            .catchAndReturn(PlanetResultModel(count: 0, next: "", previous: "", results: []))
            .subscribe(onNext: {
                planetList.accept(planetList.value + $0.results)
                
                self.planetListModelSubject.onNext(planetList.value)
            },onError: { error in
                print(error)
            })
    }
    
}
