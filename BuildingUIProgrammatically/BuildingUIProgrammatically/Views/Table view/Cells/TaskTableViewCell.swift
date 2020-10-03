//
//  TaskTableViewCell.swift
//  BuildingUIProgrammatically
//
//  Created by Amir on 29.09.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    
    //MARK: - UI components
    private lazy var checkboxButton: UIButton = {
    
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "unmarkedDark"), for: .normal)
        
        return button
    }()
    private let taskNameLabel = UILabel(textColor: #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1), font: UIFont.SFProTexMedium.withSize(18))
    private let taskDateLabel = UILabel(textColor: #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1), font: UIFont.SFProTexMedium.withSize(14))
    private let taskTimeLabel = UILabel(textColor: #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1), font: UIFont.SFProTexMedium.withSize(14))
    private let typeIndicatorView = UIView()
    
    private lazy var taskDeadlineStack = UIStackView(views: [taskDateStack, taskTimeStack], spacing: 5)
    private lazy var taskTimeStack = UIStackView(views: [timeImageView, taskTimeLabel])
    private lazy var taskDateStack = UIStackView(views: [dateImageView, taskDateLabel], spacing: 5)
    private lazy var centerStack = UIStackView(views: [taskNameLabel, taskDeadlineStack], axis: .vertical, spacing: 5)
    private lazy var mainStack = UIStackView(views: [checkboxButton, centerStack, typeIndicatorView], spacing: 9, distribution: .fillProportionally)
    
    private lazy var timeImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Alarm.pdf").withRenderingMode(.alwaysTemplate)
        imageView.tintColor = #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1).withAlphaComponent(0.5)
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(16)
        }
        return imageView
    }()
    
    private lazy var dateImageView: UIImageView = {
        
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "Calendar").withRenderingMode(.alwaysTemplate)
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(16)
        }
        return imageView
    }()
    
    private lazy var separatorLine: UIView = {
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1)
        view.alpha = 0.2
        
        return view
    }()
    
    //MARK: - Checkbbox status flag
    public var isCheckboxChecked: Bool! {
        didSet {
                                    
            mainStack.alpha = isCheckboxChecked ? 0.5 : 1
            checkboxButton.setImage(isCheckboxChecked ? #imageLiteral(resourceName: "marked") : #imageLiteral(resourceName: "unmarkedDark"), for: .normal)
        }
    }        
    
    //MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        initViews()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initViews()
        initConstraints()
    }
    
    //MARK: - UI configuration
    private func initViews() {

        selectionStyle = .none
        contentView.addSubview(mainStack)
        contentView.addSubview(separatorLine)
    }
    
    private func initConstraints() {
        
        checkboxButton.snp.makeConstraints { make in
            make.width.height.equalTo(28)
        }
        
        taskDeadlineStack.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        
        mainStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)            
        }
        
        typeIndicatorView.snp.makeConstraints { make in
            make.height.width.equalTo(28)
        }
        
        separatorLine.snp.makeConstraints { make in
            
            make.trailing.bottom.equalToSuperview()
            make.height.equalTo(1)
            make.leading.equalToSuperview().inset(60)
        }
    }
    
    func configure(with task: TaskModel) {
        
        isCheckboxChecked = task.isFinished
        
        taskNameLabel.text = task.name                
        
        switch task.type {
        case .family:
            indicatorViewSettings()
            typeIndicatorView.backgroundColor = #colorLiteral(red: 1, green: 0.9060000181, blue: 0.3799999952, alpha: 1)
        case .inbox:
            typeIndicatorView.isHidden = true
        case .work:
            indicatorViewSettings()
            typeIndicatorView.backgroundColor = #colorLiteral(red: 0.3799999952, green: 0.8709999919, blue: 0.6430000067, alpha: 1)
        case .personal:
            indicatorViewSettings()
            typeIndicatorView.backgroundColor = #colorLiteral(red: 0.7139999866, green: 0.4709999859, blue: 1, alpha: 1)
        case .shopping:
            indicatorViewSettings()
            typeIndicatorView.backgroundColor = #colorLiteral(red: 0.9570000172, green: 0.3689999878, blue: 0.4269999862, alpha: 1)
        case .none:
            typeIndicatorView.isHidden = true
        }
        
        guard let deadline = task.dateEnd else {
            taskDeadlineStack.isHidden = true
            return
        }
        
        setupDeadlineLabels(with: deadline, withEndDate: false)
    }
    
    func configureWithoutIndicator(with task: TaskModel) {
        
        isCheckboxChecked = task.isFinished
        typeIndicatorView.isHidden = true
        
        taskNameLabel.text = task.name
        backgroundColor = .clear
        
        switch task.type {
        case .family, .inbox:
            checkboxButton.tintColor = #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1)
        case .work, .personal, .shopping:
            commonColor(.white)
        case .none: return
        }
        
        guard let deadline = task.dateEnd else {
            taskDeadlineStack.isHidden = true
            return
        }
        
        setupDeadlineLabels(with: deadline, withEndDate: true)
    }
    
    private func commonColor(_ color: UIColor) {
        
        taskNameLabel.textColor = color
        separatorLine.backgroundColor = color
        taskDateStack.color(in: color)
        taskTimeStack.color(in: color)
        checkboxButton.tintColor = .white
    }
    
    private func setupDeadlineLabels(with deadline: TaskModel.DateEndModel, withEndDate: Bool) {
        
        if let taskDateEndText = deadline.endDay, withEndDate {
            taskDateLabel.text = taskDateEndText
        } else {
            taskDateStack.isHidden = true
        }
        
        if let taskTimeEndText = deadline.endTime {
            taskTimeLabel.text = taskTimeEndText
        } else {
            taskTimeStack.isHidden = true
        }
    }       
    
    private func indicatorViewSettings() {
        typeIndicatorView.layer.cornerRadius = 14
    }
}
