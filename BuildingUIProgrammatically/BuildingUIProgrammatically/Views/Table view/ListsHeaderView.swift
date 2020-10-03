//
//  ListsHeader.swift
//  BuildingUIProgrammatically
//
//  Created by Amir on 03.10.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import SnapKit

class ListsHeaderView: UIView {
    
    //MARK: - Default height value
    public static var height: CGFloat = 67
    
    //MARK: - UI components
    private lazy var listHeaderLabel = UILabel(textColor: #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1).withAlphaComponent(0.3), font: UIFont.SFProTextBold.withSize(16))
    
    //MARK: - Initializers
    init(title: String) {
        super.init(frame: .zero)
        
        listHeaderLabel.text = title
        initView()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initView()
        initConstraints()
    }
    
    //MARK: - UI configuration
    private func initView() {
        
        backgroundColor = .clear
        addSubview(listHeaderLabel)
    }
    
    private func initConstraints() {
        
        listHeaderLabel.snp.makeConstraints { make in
            
            make.leading.equalToSuperview().offset(60)
            make.top.equalToSuperview().offset(32)
            make.bottom.equalToSuperview().inset(15)
        }
    }
}
