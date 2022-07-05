//
//  ViewController.swift
//  sysco-task-ios
//
//  Created by Thathsara Senarathne on 2022-07-05.
//

import UIKit

open class BaseViewController: UIViewController {
    
    open func config(){}
    
    open func createViews(){}
    
    open func insertAndLayoutSubviews(){}

    private func doLoadThings(){
        config()
    }
    
    open override func loadView() {
        super.loadView()
        
        createViews()
        
        insertAndLayoutSubviews()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        doLoadThings()
    }


}

