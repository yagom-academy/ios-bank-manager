//
//  CustomButton.swift
//  BankManagerUIApp
//
//  Created by 이차민 on 2021/12/30.
//

import UIKit

class CustomButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String, textColor: UIColor) {
        super.init(frame: CGRect.zero)
        self.setTitle(title, for: .normal)
        self.setTitleColor(textColor, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
