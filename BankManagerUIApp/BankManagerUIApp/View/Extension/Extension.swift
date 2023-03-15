//
//  Extension.swift
//  BankManagerUIApp
//
//  Created by Rowan on 2023/03/15.
//

import UIKit

extension UIView {
    func setAutoLayout(to superView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superView.trailingAnchor),
            self.topAnchor.constraint(equalTo: superView.topAnchor),
            self.bottomAnchor.constraint(equalTo: superView.bottomAnchor)
        ])
    }
}
