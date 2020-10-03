//
//  ListTableViewCell.swift
//  BuildingUIProgrammatically
//
//  Created by Amir on 03.10.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    //MARK: - UI components
    private lazy var backView: UIView = UIView()
    private let titleLabel = UILabel(textColor: .white, font: UIFont.SFProTextSemiBold.withSize(19))
    private let subtitleLabel = UILabel(textColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5), font: UIFont.SFProTextRegular.withSize(14))
    private lazy var mainStackView: UIStackView = {
       
        let stack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .leading
        
        return stack
    }()
    
    //MARK: - Constants
    private let tasksText = "tasks"
    private let backViewCornerRadius: CGFloat = 10
    
    public static let cellHeight: CGFloat = 78
    
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
        
        contentView.addSubview(backView)
        backView.addSubview(mainStackView)
    }
    
    private func initConstraints() {
        
        mainStackView.snp.makeConstraints { make in

            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
        }
        
        backView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(4)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    func configure(with list: ListModel) {

        self.selectionStyle = .none
        backView.layer.cornerRadius = backViewCornerRadius

        titleLabel.text = list.type.rawValue
        subtitleLabel.text = "\(list.tasks.count) " + tasksText

        switch list.type {

        case .inbox, .family:
            titleLabel.textColor = #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1).withAlphaComponent(0.9)
            subtitleLabel.textColor = #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1).withAlphaComponent(0.5)
        case .personal:
            subtitleLabel.textColor = .white
            titleLabel.textColor = .white
        case .work, .shopping:
            subtitleLabel.textColor = UIColor.white.withAlphaComponent(0.5)
            titleLabel.textColor = UIColor.white.withAlphaComponent(0.9)
        case .none: return
        }

        setBackViewBackgroundColor(with: list.type)
    }
    
    private func setBackViewBackgroundColor(with type: TaskType) {
        
        var backViewbackgroundColor = UIColor.white
                
        switch type {
        
        case .inbox:
            backViewbackgroundColor = #colorLiteral(red: 0.9219999909, green: 0.9369999766, blue: 0.9610000253, alpha: 1)
        case .family:
            backViewbackgroundColor = #colorLiteral(red: 1, green: 0.9060000181, blue: 0.3799999952, alpha: 1)
        case .personal:
            backViewbackgroundColor = #colorLiteral(red: 0.7139999866, green: 0.4709999859, blue: 1, alpha: 1)
        case .work:
            backViewbackgroundColor = #colorLiteral(red: 0.3799999952, green: 0.8709999919, blue: 0.6430000067, alpha: 1)
        case .shopping:
            backViewbackgroundColor = #colorLiteral(red: 0.9570000172, green: 0.3689999878, blue: 0.4269999862, alpha: 1)
        case .none: return
        }
        
        backView.backgroundColor = backViewbackgroundColor
    }
}
