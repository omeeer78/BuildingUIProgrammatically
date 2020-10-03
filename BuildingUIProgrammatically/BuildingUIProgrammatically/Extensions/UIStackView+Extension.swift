//
//  UIStackView+Extension.swift
//  BuildingUIProgrammatically
//
//  Created by Amir on 03.10.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

extension UIStackView {
    
    /// Custom initializer for UIStackView
    /// - Parameters:
    ///   - views: Stack arranged subviews
    ///   - spacing: Spacing between arranged views (zero by default)
    ///   - distribution: Distribution type of stack (.fill by default)
    ///   - alignment: Alignment type of stack (.leading by default)
    ///   - axis: Axis type off stack (.horizontal by default)
    convenience init(views: [UIView], axis: NSLayoutConstraint.Axis = .horizontal, spacing: CGFloat = 0, distribution: Distribution = .fill, alignment: Alignment = .leading) {
        self.init(arrangedSubviews: views)
        
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.alignment = alignment
    }
    
    func color(in color: UIColor) {
        
        self.arrangedSubviews.forEach {
            switch $0 {
            case is UIImageView:
                $0.tintColor = color
            case let label as UILabel:
                label.textColor = color
            default: return
            }
        }
    }
}
