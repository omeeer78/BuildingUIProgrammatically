//
//  PlusButton.swift
//  BuildingUIProgrammatically
//
//  Created by Amir on 03.10.2020.
//  Copyright © 2020 Amir. All rights reserved.
//

import SnapKit

protocol PlusButtonDelegate: AnyObject {
    func didPressPlusButton(buttonState: Bool)
}

class PlusButton: UIView {
    
    //MARK: - Delegate
    weak var delegate: PlusButtonDelegate?
    
    //MARK: - Main button
    private let plusButton = UIButton()
    
    //MARK: - Button status flag
    private var isAddButtonAcivated: Bool = false {
        didSet {
            
            delegate?.didPressPlusButton(buttonState: isAddButtonAcivated)
            
            backgroundColor = isAddButtonAcivated ? #colorLiteral(red: 0, green: 0.423999995, blue: 1, alpha: 1) : .white
            tintColor = isAddButtonAcivated ? .white : #colorLiteral(red: 0, green: 0.423999995, blue: 1, alpha: 1)
            transform = isAddButtonAcivated
                ? CGAffineTransform(rotationAngle: .pi / 4)
                : .identity
        }
    }
        
    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
    
    //MARK: - UI configuration
    private func initView() {
                        
        self.backgroundColor = .white
        addSubview(plusButton)
        plusButton.setImage(#imageLiteral(resourceName: "Plus.pdf").withRenderingMode(.alwaysTemplate), for: .normal)
        plusButton.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
        
        plusButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }                
    }
    
    //MARK: - @objc methods
    @objc
    private func plusButtonPressed() {
        
        UIView.animate(withDuration: 0.3) {
            self.isAddButtonAcivated.toggle()
        }
    }
}
