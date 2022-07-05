//
//  PlanetHomeViewController.swift
//  sysco-task-ios
//
//  Created by Thathsara Senarathne on 2022-07-05.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class PlanetHomeViewController: BaseViewController {
    
    // varibales
    private let cellId: String = "planets_cell_id"
    
    private var viewModel: PlanetHomeViewModelType!
    
    private var disposeBag: DisposeBag!
    
    private var tableView: UITableView!
    
    private var mainLoading: MainLoading!
    
    override func config() {
        // make large navigation title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // change navigation title
        title = TitleName.planets
    }
    
    override func createViews() {
        tableView = UITableView()
        
        tableView.register(PlanetsTableViewCell.self, forCellReuseIdentifier: cellId)
        
        tableView.separatorStyle = .none
        
        tableView.backgroundColor = UIColor.clear
        
        
        
        mainLoading = MainLoading()
        
        mainLoading.isHidden = true
    }
    
    override func insertAndLayoutSubviews() {
        view.addSubview(tableView)

        tableView.activateLayouts()
        
        
        
        view.addSubview(mainLoading)
        
        mainLoading.activateLayouts()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // init view model
        viewModel = PlanetHomeViewModel()
        
        disposeBag = DisposeBag()
        
        // bind view model to controller
        bindViewModel()
        
        // API call
        viewModel.fetchPlanets()
    }
    
    func bindViewModel() {
        let planetResultModelSubject = viewModel.planetListModel.share(replay: 1, scope: .whileConnected)
        
        planetResultModelSubject.bind(to: tableView.rx.items(cellIdentifier: cellId, cellType: PlanetsTableViewCell.self)) {_, data, cell in
            cell.updateUIWithData(data: data)
        }
        .disposed(by: self.disposeBag)
        
        
        
        let loadingSubject = viewModel.mainLoading.share(replay: 1, scope: .whileConnected)
        
        loadingSubject
            .map{($0, LoadingText.loadingPlanets)}
            .bind(to: mainLoading.rx.activeLoading)
            .disposed(by: self.disposeBag)
            
    }
}
