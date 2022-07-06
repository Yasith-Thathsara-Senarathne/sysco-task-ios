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
    
    private lazy var backgroundSpinner: UIView = {
            let view = UIView(frame: CGRect(
                                x: 0,
                                y: 0,
                                width: view.frame.size.width,
                                height: 100)
            )
        let spinner = UIActivityIndicatorView.init(style: .medium)
            spinner.center = view.center
            view.addSubview(spinner)
            spinner.startAnimating()
            return view
        }()
    
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

        tableView.tableFooterView = UIView(frame: .zero)
        
        
        
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
        
        // init disposebag
        disposeBag = DisposeBag()
        
        // bind view model to controller
        bindViewModel()
        
        // API call
        viewModel.fetchPlanets()
    }
    
    func bindViewModel() {
        
        viewModel.planetListModel.bind(to: tableView.rx.items(cellIdentifier: cellId, cellType: PlanetsTableViewCell.self)) {_, data, cell in
            cell.updateUIWithData(data: data)
        }
        .disposed(by: self.disposeBag)
        
        tableView.rx
            .didScroll
            .map{ [unowned self]_  in self.tableView.isNearBottomEdge()}
            .skip(1)
            .distinctUntilChanged()
            .filter{$0}
            .subscribe(onNext: {[weak self] _ in
                guard let `self` = self else { return }
                
                self.viewModel.fetchMorePlanets()
            }).disposed(by: self.disposeBag)
        
        
        viewModel.mainLoading
            .map{($0, LoadingText.loadingPlanets)}
            .bind(to: mainLoading.rx.activeLoading)
            .disposed(by: self.disposeBag)
        
        viewModel.backgroundLoading.subscribe { [weak self] in
            guard let `self` = self else { return }
            
            self.tableView.tableFooterView = $0.element ?? false ? self.backgroundSpinner : UIView(frame: .zero)
        }.disposed(by: self.disposeBag)
        
    }
}
