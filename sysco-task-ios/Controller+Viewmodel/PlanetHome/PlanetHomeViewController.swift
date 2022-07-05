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
    
    private let cellId: String = "planets_cell_id"
    
    private var viewModel: PlanetHomeViewModelType!
    
    private var disposeBag: DisposeBag!
    
    private var tableView: UITableView!
    
    override func config() {
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = TitleNames.planets
    }
    
    override func createViews() {
        tableView = UITableView()
        
        tableView.register(PlanetsTableViewCell.self, forCellReuseIdentifier: cellId)
        
        tableView.separatorStyle = .none
        
        tableView.backgroundColor = UIColor.clear
    }
    
    override func insertAndLayoutSubviews() {
        view.addSubview(tableView)
        
        tableView.activateLayouts()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = PlanetHomeViewModel()
        
        disposeBag = DisposeBag()
        
        viewModel.fetchPlanets()
        
        bindViewModel()
    }
    
    func bindViewModel() {
        let planetResultModelSubject = viewModel.planetListModel.share(replay: 1, scope: .whileConnected)
        
        planetResultModelSubject.bind(to: tableView.rx.items(cellIdentifier: cellId, cellType: PlanetsTableViewCell.self)) {_, item, cell in
            cell.setPlanetName(value: item.name)
            cell.setPlanetClimate(value: item.climate)
        }
        .disposed(by: self.disposeBag)
            
    }
}
