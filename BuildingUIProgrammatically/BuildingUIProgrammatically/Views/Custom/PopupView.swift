//
//  PopupView.swift
//  BuildingUIProgrammatically
//
//  Created by Amir on 03.10.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import UIKit

class PopupView: UIView {
    
    //MARK: - UI Components
    private let taskItem = PopupItem(item: PopupItemModel.taskModelMockup)
    private let separatorLine = UIView()
    private let listItem = PopupItem(item: PopupItemModel.listModelMockup)
    
    private lazy var mainStack = UIStackView(views: [taskItem, separatorLine, listItem], axis: .vertical, distribution: .fillProportionally)
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initView()
        initConstrains()
        addShadow(color: #colorLiteral(red: 0.08235294118, green: 0.137254902, blue: 0.2196078431, alpha: 0.2), radius: 30, height: 10)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    //MARK: - UI configuration
    private func initView() {
        
        separatorLine.backgroundColor = #colorLiteral(red: 0.9219999909, green: 0.9369999766, blue: 0.9610000253, alpha: 1)
        addSubview(mainStack)
        
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
    
    private func initConstrains() {
        
        separatorLine.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(1)
        }
        
        taskItem.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        
        listItem.snp.makeConstraints { make in
            make.width.equalToSuperview()
        }
        
        mainStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

//MARK: - PopupItemModel helper
fileprivate struct PopupItemModel {
    
    let icon: UIImage
    let title: String
    
    static let taskModelMockup = PopupItemModel(icon: #imageLiteral(resourceName: "Task.pdf"), title: "Task")
    static let listModelMockup = PopupItemModel(icon: #imageLiteral(resourceName: "Lists"), title: "List")
}

//MARK: - Popup item view
fileprivate class PopupItem: UIView {
    
    //MARK: - Item reference
    private var item: PopupItemModel!
    
    //MARK: - UI components
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel(textColor: #colorLiteral(red: 0, green: 0.423999995, blue: 1, alpha: 1), font: UIFont.SFProTextSemiBold.withSize(18))
    
    //MARK: - Initializers
    init(item: PopupItemModel) {
        super.init(frame: .zero)
        
        self.item = item
        
        initView()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: - UI configuration
    private func initView() {
        
        backgroundColor = .white
        
        iconImageView.image = item.icon
        titleLabel.text = item.title
        
        addSubview(iconImageView)
        addSubview(titleLabel)
    }
    
    private func initConstraints() {
        
        iconImageView.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview().inset(18)
            make.width.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(19)
            make.leading.equalTo(iconImageView.snp.trailing).offset(12)
        }
    }
}
