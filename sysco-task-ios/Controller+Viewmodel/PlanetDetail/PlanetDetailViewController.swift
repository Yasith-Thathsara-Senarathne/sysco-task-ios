//
//  PlanetDetailViewController.swift
//  sysco-task-ios
//
//  Created by Thathsara Senarathne on 2022-07-06.
//

import Foundation
import UIKit
import RxSwift

class PlanetDetailViewController: BaseViewController {
    
    // variables
    var viewModel = PlanetDetailViewModel()
    
    let disposeBag = DisposeBag()
    
    private var orbitalPeriodPlaceholderLabel: UILabel!
    
    private var gravityPlaceholderLabel: UILabel!
    
    private var orbitalPeriodLabel: UILabel!
    
    private var gravityLabel: UILabel!
    
    override func config() {
        view.backgroundColor = UIColor.white
        
        title = viewModel.planetModel?.name.capitalized
    }
    
    override func createViews() {
        orbitalPeriodPlaceholderLabel = UILabel()
        
        orbitalPeriodPlaceholderLabel.font = .tvTitle
        
        orbitalPeriodPlaceholderLabel.text = "Orbital Period"
        
        
        gravityPlaceholderLabel = UILabel()
        
        gravityPlaceholderLabel.font = .tvTitle
        
        gravityPlaceholderLabel.text = "Gravity"
        
        
        orbitalPeriodLabel = UILabel()
        
        orbitalPeriodLabel.font = .labelTitle
        
        orbitalPeriodLabel.numberOfLines = 1
        
        
        gravityLabel = UILabel()
        
        gravityLabel.font = .labelTitle
        
        gravityLabel.numberOfLines = 0
    }
    
    override func insertAndLayoutSubviews() {
        let vStackView = UIStackView()
        
        vStackView.axis = .vertical
        
        vStackView.spacing = 12
        
        
        let orbitalPeriodHStackView = UIStackView()
        
        orbitalPeriodHStackView.axis = .horizontal
        
        orbitalPeriodHStackView.distribution = .fillEqually
        
        orbitalPeriodHStackView.addArrangedSubview(orbitalPeriodPlaceholderLabel)
        
        orbitalPeriodHStackView.addArrangedSubview(orbitalPeriodLabel)
        
        
        let gravityHStackView = UIStackView()
        
        gravityHStackView.axis = .horizontal
        
        gravityHStackView.distribution = .fillEqually
        
        gravityHStackView.addArrangedSubview(gravityPlaceholderLabel)
        
        gravityHStackView.addArrangedSubview(gravityLabel)
        
        
        vStackView.addArrangedSubview(orbitalPeriodHStackView)
        
        vStackView.addArrangedSubview(gravityHStackView)
        
        view.addSubview(vStackView)
        
        vStackView.activateLayouts(to: view, [.top: 30, .leading: 20, .trailing: -20], true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let planetModel = viewModel.planetModel {
            updateUIWithData(data: planetModel)
        }
    }
    
    private func updateUIWithData(data: PlanetModel) {
        orbitalPeriodLabel.text = data.orbitalPeriod
        
        gravityLabel.text = data.gravity
    }
}
