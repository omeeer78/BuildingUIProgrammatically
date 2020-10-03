//
//  TodayScreenMainView.swift
//  BuildingUIProgrammatically
//
//  Created by Amir on 28.09.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

class TodayScreenMainView: UIView {
    
    //MARK: - UI components
    private let titleView = TitleView()
    private lazy var tableView = MainTableView(type: .lists, lists: lists, tasks: tasks)
    private lazy var popupView = PopupView()
    private lazy var plusButton = PlusButton(frame: CGRect(origin: .zero, size: CGSize(width: 64, height: 64)))
    
    //MARK: - MainTableViewDelegate reference
    weak var mainTableDelegate: MainTableViewDelegate? {
        didSet {
            tableView.mainTableDelegate = mainTableDelegate
        }
    }
    
    //MARK: - Tasks & lists arrays
    private let tasks = TaskModel.mockups
    private let lists = ListModel.mockups
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initViews()
        initConstraints()
    }        
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initViews()
    }
    
    //MARK: - UI configuration
    private func initViews() {
        
        backgroundColor = .white
        
        popupView.alpha = 0
        
        addSubview(titleView)
        addSubview(tableView)
        addSubview(popupView)
                
        addPlusButton(plusButton: plusButton, delegate: self)
        popupView.addShadow(color: .red, radius: 30, height: 10)
    }
    
    private func initConstraints() {
        
        popupView.snp.makeConstraints { make in
            
            make.trailing.equalToSuperview().inset(16)
            make.size.equalTo(CGSize(width: 220, height: 120))
            make.bottom.equalTo(plusButton.snp.top).inset(-16)
        }
        
        titleView.snp.makeConstraints { make in
            
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.height.equalTo(73)
            make.leading.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            
            make.top.equalTo(titleView.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

//MARK: - PlusButtonDelegate
extension TodayScreenMainView: PlusButtonDelegate {
    
    func didPressPlusButton(buttonState: Bool) {
        
        UIView.animate(withDuration: 0.4, animations: {
            
            self.popupView.alpha = buttonState ? 1 : 0
            self.tableView.alpha = buttonState ? 0.3 : 1
            
        }) { _ in
            self.tableView.isUserInteractionEnabled = !buttonState
        }
    }    
}
