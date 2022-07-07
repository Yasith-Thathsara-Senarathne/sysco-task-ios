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
    
    private let viewModel = PlanetHomeViewModel()
    
    private let disposeBag = DisposeBag()
    
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
        view.backgroundColor = UIColor.white
        
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
        
        // bind view model to controller
        bindViewModel()
        
        // API call
        viewModel.fetchPlanets()
    }
    
    func bindViewModel() {
        
        // bind data to tableview
        viewModel.planetListModel.bind(to: tableView.rx.items(cellIdentifier: cellId, cellType: PlanetsTableViewCell.self)) {_, data, cell in
            cell.updateUIWithData(data: data, with: "https://picsum.photos/200")
        }
        .disposed(by: self.disposeBag)
        
        tableView.rx.modelSelected(PlanetModel.self)
            .subscribe(onNext: { [unowned self] data in
                self.handlePlanetOnTapped(data: data)
                
            }).disposed(by: self.disposeBag)
        
        // tableview scroll to bottom
        tableView.rx
            .didScroll
            .map{ [unowned self] _ in self.tableView.isNearBottomEdge()}
            .skip(1)
            .distinctUntilChanged()
            .filter{$0}
            .subscribe(onNext: {[weak self] _ in
                guard let `self` = self else { return }
                
                self.viewModel.fetchMorePlanets()
            }).disposed(by: self.disposeBag)
        
        // bind data to mainloading
        viewModel.mainLoading
            .map{($0, LoadingText.loadingPlanets)}
            .bind(to: mainLoading.rx.activeLoading)
            .disposed(by: self.disposeBag)
        
        // bind date to backgroundloading
        viewModel.backgroundLoading.subscribe { [weak self] in
            guard let `self` = self else { return }
            
            self.tableView.tableFooterView = $0.element ?? false ? self.backgroundSpinner : UIView(frame: .zero)
        }.disposed(by: self.disposeBag)
        
    }
    
    private func handlePlanetOnTapped(data: PlanetModel) {
        let planetDetailVC = PlanetDetailViewController()
        
        planetDetailVC.viewModel.planetModel = data
        
        self.navigationController?.pushViewController(planetDetailVC, animated: true)
    }
}
