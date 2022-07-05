//
//  BaseTableViewCell.swift
//  sysco-task-ios
//
//  Created by Thathsara Senarathne on 2022-07-05.
//

import Foundation
import UIKit

open class BaseTableViewCell: UITableViewCell {
    open func config(){}
    
    open func createViews(){}
    
    open func insertAndLayoutSubviews(){}
    
    private func doLoadThings(){
        config()
        createViews()
        insertAndLayoutSubviews()
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        doLoadThings()
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        doLoadThings()
    }
}
