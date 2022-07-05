//
//  MainLoading.swift
//  sysco-task-ios
//
//  Created by Thathsara Senarathne on 2022-07-06.
//

import Foundation
import UIKit

class MainLoading: BaseView {
    var activityIndicator: UIActivityIndicatorView!
    
    var loadingLabel: UILabel!
    
    override func config() {
        backgroundColor = .clear
    }
    
    override func createViews() {
        activityIndicator = UIActivityIndicatorView.init(style: .medium)
        
        
        loadingLabel = UILabel()
        
        loadingLabel.textAlignment = .center
        
        loadingLabel.font = .labelBody
    }
    
    
    override func insertAndLayoutSubviews() {
        addSubview(activityIndicator)
        
        activityIndicator.activateLayouts([.centerX: 0, .centerY: 0])
        
        
        
        addSubview(loadingLabel)
        
        loadingLabel.activateLayouts([.leading: 20, .trailing: -20, .centerY: 30])
    }
}
