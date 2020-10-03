//
//  TitleView.swift
//  BuildingUIProgrammatically
//
//  Created by Amir on 28.09.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import SnapKit

class TitleView: UIView {
    
    //MARK: - UI components
    lazy var titleLabel = UILabel(textColor: #colorLiteral(red: 0.1449999958, green: 0.1650000066, blue: 0.1920000017, alpha: 1), font: UIFont.SFProDisplayBold.withSize(32))
    lazy var moreButton: UIButton = {
        
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "More"), for: .normal)
        
        return button
    }()
    
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initViews()
    }
    
    //MARK: - UI configuration
    private func initViews() {
        
        titleLabel.text = "Today"
        self.backgroundColor = .white
        
        moreButton.contentHorizontalAlignment = .trailing
        let mainStackView = UIStackView(arrangedSubviews: [titleLabel, moreButton])
        addSubview(mainStackView)
        
        mainStackView.snp.makeConstraints { make in
            
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(60)
            make.right.equalToSuperview().inset(14)
        }
    }
}
