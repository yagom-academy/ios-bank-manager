//
//  HorizontalStackView.swift
//  BankManagerUIApp
//
//  Created by 릴라, Rowan on 2023/03/13.
//

import UIKit

class HorizontalStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    //override init()
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.distribution = .fillEqually
        self.axis = .horizontal
    }

}

class VerticalStackView: UIStackView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        self.distribution = .fillEqually
        self.axis = .vertical
    }
}
