//
//  ButtonStackView.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/13.
//

import UIKit

final class ButtonStackView: UIStackView {
    let addClientButton = AddClientButton()
    let resetButton = ResetButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        setUpButtonStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
