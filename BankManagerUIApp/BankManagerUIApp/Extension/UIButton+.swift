//
//  UIButton+.swift
//  BankManagerUIApp
//
//  Created by minsong kim on 2023/07/19.
//

import UIKit

extension UIButton {
    convenience init(title: String, color: UIColor, action: UIAction) {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.backgroundColor = .systemBackground
        self.setTitleColor(color, for: .normal)
        self.addAction(action, for: .touchUpInside)
        
    }
}
