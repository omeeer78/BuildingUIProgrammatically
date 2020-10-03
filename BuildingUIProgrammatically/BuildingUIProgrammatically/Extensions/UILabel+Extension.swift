//
//  UILabel+Extension.swift
//  BuildingUIProgrammatically
//
//  Created by Amir on 29.09.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

extension UILabel {
    
    convenience init(textColor: UIColor, font: UIFont) {
        self.init()
        
        self.numberOfLines = 0
        self.textColor = textColor
        self.font = font
    }
}
