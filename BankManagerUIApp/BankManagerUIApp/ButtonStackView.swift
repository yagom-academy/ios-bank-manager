//
//  BankManagerUIApp - ButtonStackView.swift
//  Created by Ayaan, Som, Dragon.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

class ButtonStackView: UIStackView {
    private let addButton: UIButton = {
        let button: UIButton = UIButton()
        
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let resetButton: UIButton = {
        let button: UIButton = UIButton()
        
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setSubView()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    func configure() {
        self.alignment = .fill
        self.distribution = .fill
        self.axis = .vertical
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setSubView() {
        self.addArrangedSubview(addButton)
        self.addArrangedSubview(resetButton)
    }
}
