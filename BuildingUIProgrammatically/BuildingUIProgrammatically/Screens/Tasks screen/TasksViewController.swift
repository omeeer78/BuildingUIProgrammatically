//
//  TasksViewController.swift
//  BuildingUIProgrammatically
//
//  Created by Amir on 03.10.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController {
    
    //MARK: - Selected list
    private var list: ListModel!
    
    //MARK: - Main view
    private lazy var mainView = TasksScreenView(list: list)
    
    //MARK: - VC lifecycle    
    override func loadView() {
        view = mainView        
    }
    
    //MARK: - VC configuration
    func configure(with list: ListModel) {
        self.list = list
    }
}
