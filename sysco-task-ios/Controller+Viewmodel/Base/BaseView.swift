//
//  BaseView.swift
//  sysco-task-ios
//
//  Created by Thathsara Senarathne on 2022-07-06.
//

import UIKit

class BaseView: UIView {
    open func config(){}
    
    open func createViews(){}
    
    open func insertAndLayoutSubviews(){}
    
    private func doLoadThings(){
        config()
        
        createViews()
        
        insertAndLayoutSubviews()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        doLoadThings()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        doLoadThings()
    }
}
