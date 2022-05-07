//
//  StackView+.swift
//  BankManagerUIApp
//
//  Created by Eddy, dudu on 2022/05/07.
//

import UIKit

extension UIStackView {
    func removeAllSubViews() {
        arrangedSubviews.forEach { subView in
            subView.removeFromSuperview()
        }
    }
    
    func addArrangedSubViews(_ views: [UIView]) {
        views.forEach { view in
            addArrangedSubview(view)
        }
    }
}
