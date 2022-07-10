//
//  UIStackView+Extensions.swift
//  BankManagerUIApp
//
//  Created by 이원빈 on 2022/07/10.
//

import UIKit

extension UIStackView {
    func removeSubview(_ view: UIView) {
        self.removeArrangedSubview(view)
        view.isHidden = true
    }
}
