//
//  CustomWrapper.swift
//  sysco-task-ios
//
//  Created by Thathsara Senarathne on 2022-07-06.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base : MainLoading {
    var activeLoading: Binder<(Bool, String)> {
        return Binder(self.base) { view, value in
            value.0 == true ? view.activityIndicator.startAnimating() : view.activityIndicator.stopAnimating()
            
            view.isHidden = !value.0
            
            view.loadingLabel.text = value.1
            
            print("Fetch called wrapper value:", value.0)
        }
    }
}
