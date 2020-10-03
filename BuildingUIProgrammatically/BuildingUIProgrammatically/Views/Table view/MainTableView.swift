//
//  MainTableView.swift
//  BuildingUIProgrammatically
//
//  Created by Amir on 03.10.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

enum MainTableType {
    case lists, tasks
}

protocol MainTableViewDelegate: AnyObject {
    func didSelect(list: ListModel)
}

class MainTableView: UITableView {

    //MARK: - Table type
    private let type: MainTableType!
    
    //MARK: - Tasks & lists arrays
    private var tasks: [TaskModel]?
    private var lists: [ListModel]?
    
    //MARK: - Delegate reference
    weak var mainTableDelegate: MainTableViewDelegate?

    //MARK: - Initializers
    init(type: MainTableType, lists: [ListModel]? = nil, tasks: [TaskModel]? = nil) {
        self.type = type
        
        super.init(frame: .zero, style: .plain)
        
        self.lists = lists
        self.tasks = tasks
        initView()
    }
    
    required init?(coder: NSCoder) {
        self.type = .none
        super.init(coder: coder)
        initView()
    }

    //MARK: - UI configuration
    private func initView() {
        
        [TaskTableViewCell.self, ListTableViewCell.self].forEach { register(cell: $0) }
        dataSource = self
        delegate = self
        separatorStyle = .none
    }
    
    //MARK: - Helper methods
    func toogleCheckboxFlag(in indexPath: IndexPath) {
        
        let cell = cellForRow(at: indexPath) as! TaskTableViewCell
        cell.isCheckboxChecked.toggle()
    }
    
    func getConfiguredTasksCell(in indexPath: IndexPath, withTypeIndicator: Bool = true) -> TaskTableViewCell {
     
        let cell = dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier, for: indexPath) as! TaskTableViewCell
        if let task = tasks?[indexPath.row] {
            withTypeIndicator ? cell.configure(with: task) : cell.configureWithoutIndicator(with: task)
        } else {
            fatalError("Unexpectedly found nil in tasks array")
        }
        return cell
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension MainTableView: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        type == .lists ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch type {
        case .lists:
            return section == 0 ? tasks?.count ?? 0 : lists?.count ?? 0
        case .tasks:
            return tasks?.count ?? 0
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard type == .lists else {
            return getConfiguredTasksCell(in: indexPath, withTypeIndicator: false)
        }
        
        switch indexPath.section {
        case 0:
            return getConfiguredTasksCell(in: indexPath)
        case 1:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as! ListTableViewCell
            if let list = lists?[indexPath.row] {
                cell.configure(with: list)
            } else {
                fatalError("Unexpectedly found nil in lists array")
            }
            return cell
            
        default: return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard type == .lists else { return nil }
        return section == 1 ? ListsHeaderView(title: "Lists") : nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard type == .lists else { return 0 }
        return section == 1 ? ListsHeaderView.height : 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard type == .lists else { return UITableView.automaticDimension }
        return indexPath.section ==  1 ? ListTableViewCell.cellHeight : UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard type == .lists else {
            toogleCheckboxFlag(in: indexPath)
            return
        }
        
        switch indexPath.section {
        case 0:
            toogleCheckboxFlag(in: indexPath)
        case 1:
            guard let list = lists?[indexPath.row] else { return }
            mainTableDelegate?.didSelect(list: list)            
        default: return
        }
    }
}
