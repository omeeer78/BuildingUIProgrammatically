//
//  ViewController.swift
//  BuildingUIProgrammatically
//
//  Created by Amir on 28.09.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {

    //MARK: - Main view
    let mainView = TodayScreenMainView()
    
    //MARK: - VC lifecycle
    override func loadView() {
        
        mainView.mainTableDelegate = self
        view = mainView
    }
}

//MARK: - MainTableViewDelegate
extension TodayViewController: MainTableViewDelegate {
    
    func didSelect(list: ListModel) {
        
        let tasksViewController = TasksViewController()
        tasksViewController.configure(with: list)
        
        present(tasksViewController, animated: true)
    }
}
