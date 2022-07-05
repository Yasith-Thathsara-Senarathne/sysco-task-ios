//
//  PlanetsTableViewCell.swift
//  sysco-task-ios
//
//  Created by Thathsara Senarathne on 2022-07-05.
//

import UIKit

class PlanetsTableViewCell: BaseTableViewCell {
    private var planetNameLabel: UILabel!
    
    private var planetClimateLabel: UILabel!
    
    func updateUIWithData(data: PlanetModel) {
        planetNameLabel.text = data.name.capitalized
        
        planetClimateLabel.text = data.climate.capitalized
    }
    
    override func config() {
        backgroundColor = UIColor.clear
    }
    
    override func createViews() {
        planetNameLabel = UILabel()
        
        planetNameLabel.font = .tvTitle
        
        
        
        planetClimateLabel = UILabel()
        
        planetClimateLabel.font = .tvSubTitle
        
    }
    
    override func insertAndLayoutSubviews() {
        let vStackView = UIStackView()
        
        vStackView.axis = .vertical
        
        vStackView.distribution = .fill
        
        vStackView.spacing = 4
        
        vStackView.addArrangedSubview(planetNameLabel)
        
        vStackView.addArrangedSubview(planetClimateLabel)
        
        addSubview(vStackView)
        
        vStackView.activateLayouts(equalConstant: 20, to: self)
        
    }
}
