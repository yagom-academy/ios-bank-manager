//
//  UILabel+.swift
//  BankManagerUIApp
//
//  Created by minsong kim on 2023/07/19.
//

import UIKit

extension UILabel {
    convenience init(text: String, textColor: UIColor) {
        self.init(frame: .zero)
        self.text = text
        self.textColor = textColor
    }
}
