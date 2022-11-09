//
//  BankManagerUIApp - ButtonStackView.swift
//  Created by Ayaan, Som, Dragon.
//  Copyright © yagom academy. All rights reserved.
//

import UIKit

final class ButtonStackView: UIStackView {
    let addButton: UIButton = {
        let button: UIButton = UIButton()
        
        button.setTitle("고객 10명 추가", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let resetButton: UIButton = {
        let button: UIButton = UIButton()
        
        button.setTitle("초기화", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        configure()
        setSubView()
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    private func configure() {
        self.alignment = .fill
        self.distribution = .fillEqually
        self.axis = .horizontal
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setSubView() {
        self.addArrangedSubview(addButton)
        self.addArrangedSubview(resetButton)
    }
}
