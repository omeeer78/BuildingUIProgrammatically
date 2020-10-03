//
//  UIView+Extension.swift
//  AdvancedUi
//
//  Created by Amir on 27.09.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

extension UIView {
    
    func addShadow(color: UIColor, radius: CGFloat, height: CGFloat) {
        
        let shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 0)
        self.layer.shadowPath = shadowPath.cgPath
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = CGSize(width: 0, height: height)
    }
    
    func addPlusButton(plusButton: PlusButton, delegate: PlusButtonDelegate) {
                
        plusButton.delegate = delegate
        
        addSubview(plusButton)
        
        plusButton.snp.makeConstraints { make in
         
            make.height.width.equalTo(64)
            make.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(10)
        }
        
        plusButton.layer.cornerRadius = 32
        plusButton.addShadow(color: #colorLiteral(red: 0.08235294118, green: 0.137254902, blue: 0.2196078431, alpha: 0.16), radius: 32, height: 24)
    }
}
