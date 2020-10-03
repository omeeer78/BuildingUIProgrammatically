//
//  ListsTitleView.swift
//  BuildingUIProgrammatically
//
//  Created by Amir on 03.10.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

class ListsTitleView: UIView {
    
    //MARK: - UI components
    private let titleLabel = UILabel(textColor: #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1), font: UIFont.SFProDisplayBold.withSize(32))
    private let subtitleLabel = UILabel(textColor: #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1).withAlphaComponent(0.5), font: UIFont.SFProTextRegular.withSize(16))
    private let editButton = UIButton()
    private lazy var titlesStack = UIStackView(views: [titleLabel, subtitleLabel], axis: .vertical, spacing: 5, distribution: .fill, alignment: .leading)
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initView()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
        initConstraints()
    }
    
    //MARK: - UI configuration
    func configure(with list: ListModel) {
       
        titleLabel.text = list.type.rawValue

        let tasks = list.tasks
        let tasksText = tasks.count == 1 ? "task" : "tasks"
        subtitleLabel.text = "\(tasks.count) " + tasksText

        switch list.type {
        case .inbox:
            titleLabel.textColor = #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1)
            self.backgroundColor = #colorLiteral(red: 0.9219999909, green: 0.9369999766, blue: 0.9610000253, alpha: 1)
            editButton.tintColor = #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1)
        case .work:
            subtitleLabel.textColor = .white
            titleLabel.textColor = .white
            self.backgroundColor = #colorLiteral(red: 0.3799999952, green: 0.8709999919, blue: 0.6430000067, alpha: 1)
            editButton.tintColor = .white
        case .personal:
            subtitleLabel.textColor = .white
            titleLabel.textColor = .white
            self.backgroundColor = #colorLiteral(red: 0.7139999866, green: 0.4709999859, blue: 1, alpha: 1)
            editButton.tintColor = .white
        case .shopping:
            subtitleLabel.textColor = .white
            titleLabel.textColor = .white
            self.backgroundColor = #colorLiteral(red: 0.9570000172, green: 0.3689999878, blue: 0.4269999862, alpha: 1)
            editButton.tintColor = .white
        case .family:
            titleLabel.textColor = #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1)
            self.backgroundColor = #colorLiteral(red: 1, green: 0.9060000181, blue: 0.3799999952, alpha: 1)
            editButton.tintColor = #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1)
        case .none: return
        }
    }
    
    private func initView() {
        
        editButton.setImage(#imageLiteral(resourceName: "Shape.pdf").withRenderingMode(.alwaysTemplate), for: .normal)
        
        addSubview(titlesStack)
        addSubview(editButton)
    }
    
    private func initConstraints() {
        
        editButton.snp.makeConstraints { make in
            
            make.width.height.equalTo(24)
            make.top.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(12)
        }
        
        titlesStack.snp.makeConstraints { make in
            
            make.top.bottom.equalToSuperview().inset(16)
            make.leading.equalToSuperview().offset(60)
        }
    }
}
