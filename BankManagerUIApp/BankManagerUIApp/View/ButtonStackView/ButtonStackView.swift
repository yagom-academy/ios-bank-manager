//
//  ButtonStackView.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/13.
//

import UIKit

final class ButtonStackView: UIStackView {
    private let addClientButton = AddClientButton()
    private let resetButton = ResetButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setUpButtonStackView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func configure() {
        self.axis = .horizontal
        self.distribution = .fillEqually
    }
    
    private func setUpButtonStackView() {
        self.addArrangedSubview(addClientButton)
        self.addArrangedSubview(resetButton)
    }
}
