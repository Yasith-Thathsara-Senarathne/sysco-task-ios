//
//  UIFont+Extension.swift
//  sysco-task-ios
//
//  Created by Thathsara Senarathne on 2022-07-06.
//

import Foundation
import UIKit

extension UIFont {
    
    class var tvTitle:UIFont {
        return .systemFont(ofSize: 20, weight: .bold)
    }
    
    class var tvSubTitle:UIFont {
        return .systemFont(ofSize: 16, weight: .medium)
    }
    
    class var labelTitle: UIFont {
        return .systemFont(ofSize: 20, weight: .medium)
    }
    
    class var labelBody: UIFont {
        return .systemFont(ofSize: 14)
    }
}
