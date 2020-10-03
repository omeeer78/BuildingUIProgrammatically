//
//  ListsHeader.swift
//  BuildingUIProgrammatically
//
//  Created by Amir on 03.10.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import SnapKit

class ListsHeaderVie: UIView {
    
    public static var height: CGFloat = 67
    
    private lazy var listHeaderLabel: UILabel = {
        
        let label = UILabel(textColor: #colorLiteral(red: 0.9219999909, green: 0.9369999766, blue: 0.9610000253, alpha: 1), font: UIFont.SFProTextBold.withSize(16))
        label.text = "Lists"
        
        return label
    }()
    
    init(title: String) {
        super.init(frame: .zero)
        
        initView()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        initView()
        initConstraints()
    }
    
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
