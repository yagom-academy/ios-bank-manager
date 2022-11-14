//
//  UIStackView+.swift
//  BankManagerUIApp
//
//  Created by Kyo, Wonbi on 2022/11/13.
//

import UIKit

extension UIStackView {
    func removeAllArrangedSubviews() {
        self.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}
