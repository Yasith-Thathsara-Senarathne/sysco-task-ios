//
//  PlanetsTableViewCell.swift
//  sysco-task-ios
//
//  Created by Thathsara Senarathne on 2022-07-05.
//

import UIKit

class PlanetsTableViewCell: BaseTableViewCell {
    private var planetName: UILabel!
    
    private var planetClimate: UILabel!
    
    public func setPlanetName(value: String) {
        planetName.text = value.capitalized
    }
    
    public func setPlanetClimate(value: String) {
        planetClimate.text = value.capitalized
    }
    
    override func config() {
        backgroundColor = UIColor.clear
    }
    
    override func createViews() {
        planetName = UILabel()
        planetName.font = .systemFont(ofSize: 20, weight: .bold)
        
        planetClimate = UILabel()
        planetClimate.font = .systemFont(ofSize: 16, weight: .medium)
        
    }
    
    override func insertAndLayoutSubviews() {
        let vStackView = UIStackView()
        vStackView.axis = .vertical
        vStackView.distribution = .fill
        vStackView.spacing = 4
        
        vStackView.addArrangedSubview(planetName)
        vStackView.addArrangedSubview(planetClimate)
        
        addSubview(vStackView)
        vStackView.activateLayouts(equalConstant: 20, to: self)
        
    }
}
