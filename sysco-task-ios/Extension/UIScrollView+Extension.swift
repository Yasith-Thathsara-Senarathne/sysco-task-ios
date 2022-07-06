//
//  UIScrollView+Extension.swift
//  sysco-task-ios
//
//  Created by Thathsara Senarathne on 2022-07-06.
//

import Foundation
import UIKit

public extension UIScrollView {
    
    func  isNearBottomEdge(edgeOffset: CGFloat = 20) -> Bool {
        return self.contentOffset.y + self.frame.size.height + edgeOffset > self.contentSize.height
    }
}
