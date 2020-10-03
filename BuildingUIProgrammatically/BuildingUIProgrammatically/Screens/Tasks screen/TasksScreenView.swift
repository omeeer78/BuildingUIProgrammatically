//
//  TasksScreenView.swift
//  BuildingUIProgrammatically
//
//  Created by Amir on 03.10.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

class TasksScreenView: UIView {
    
    //MARK: - UI Components
    private lazy var tasksTableView = MainTableView(type: .tasks, tasks: list.tasks)
    private lazy var titleView = ListsTitleView()
    private lazy var plusButton = PlusButton(frame: CGRect(origin: .zero, size: CGSize(width: 64, height: 64)))
    
    //MARK: - Tasks array
    private var tasks: [TaskModel]!
    private var list: ListModel!
    
    //MARK: - Initializer
    init(list: ListModel) {
        super.init(frame: .zero)
        
        self.list = list
        
        initViews()
        initConstraints()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initViews()
        initConstraints()
    }
    
    //MARK: - UI configuration
    private func initViews() {
        
        addSubview(titleView)
        addSubview(tasksTableView)
        
        addPlusButton(plusButton: plusButton, delegate: self)
    }
    
    private func initConstraints() {
        
        titleView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(112)
        }
        
        tasksTableView.snp.makeConstraints { make in
            
            make.top.equalTo(titleView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func configureUI() {

        titleView.configure(with: list)
        
        switch list.type {
        case .inbox:
            tasksTableView.backgroundColor = #colorLiteral(red: 0.9219999909, green: 0.9369999766, blue: 0.9610000253, alpha: 1)
        case .work:
            tasksTableView.backgroundColor = #colorLiteral(red: 0.3799999952, green: 0.8709999919, blue: 0.6430000067, alpha: 1)
        case .personal:
            tasksTableView.backgroundColor = #colorLiteral(red: 0.7139999866, green: 0.4709999859, blue: 1, alpha: 1)
        case .shopping:
            tasksTableView.backgroundColor = #colorLiteral(red: 0.9570000172, green: 0.3689999878, blue: 0.4269999862, alpha: 1)
        case .family:
            tasksTableView.backgroundColor = #colorLiteral(red: 1, green: 0.9060000181, blue: 0.3799999952, alpha: 1)
        case .none: return
        }
    }
}

//MARK: - PlusButtonDelegate
extension TasksScreenView: PlusButtonDelegate {
    
    func didPressPlusButton(buttonState: Bool) {
        print(buttonState)
    }
}
