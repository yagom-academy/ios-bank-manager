//
//  FactoryLabel.swift
//  BankManagerUIApp
//
//  Created by Jae-hoon Sim on 2021/12/31.
//

import UIKit

enum BankUIComponent {
    
    static func makeButton(text: String, textColor: UIColor) -> UIButton {
        let button = UIButton()
        button.setTitle(text, for: .normal)
        button.setTitleColor(textColor, for: .normal)
        button.titleLabel?.font = .preferredFont(forTextStyle: .body)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        return button
    }
    
    static func makeLabel(text: String, textStyle: UIFont.TextStyle, textColor: UIColor = .label, backgroundColor: UIColor = .white) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = .preferredFont(forTextStyle: textStyle)
        label.adjustsFontForContentSizeCategory = true
        label.textAlignment = .center
        label.backgroundColor = backgroundColor
        return label
    }
}
