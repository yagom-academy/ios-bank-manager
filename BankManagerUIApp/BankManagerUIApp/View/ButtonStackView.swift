//
//  ButtonStackView.swift
//  BankManagerUIApp
//
//  Created by 리지, 무리 on 2023/03/13.
//

import UIKit

final class ButtonStackView: UIStackView {
    private func configure() {
        self.axis = .horizontal
        self.distribution = .fillEqually
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
