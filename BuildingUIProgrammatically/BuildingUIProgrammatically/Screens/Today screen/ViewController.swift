//
//  ViewController.swift
//  BuildingUIProgrammatically
//
//  Created by Amir on 28.09.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {

    let mainView = TodayScreenMainView()
    
    override func loadView() {
        mainView.mainTableDelegate = self
        view = mainView
    }
}

extension TodayViewController: MainTableViewDelegate {
    
    func didSelect(list: ListModel) {
        let tasksViewController = TasksViewController()
        tasksViewController.configure(with: list)
        present(tasksViewController, animated: true)
    }
}
