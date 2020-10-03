//
//  UITable+Extensions.swift
//  AdvancedUi
//
//  Created by Amir on 26.09.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register(cell: UITableViewCell.Type) {
        register(cell, forCellReuseIdentifier: cell.identifier)
    }
}

extension UITableViewCell {
    
    static var identifier: String {
        return String(describing: self)
    }
}
